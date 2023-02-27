var makeCRCTable = function(){
	var c;
	var crcTable = [];
	for(var n =0; n < 256; n++){
		c = n;
		for(var k =0; k < 8; k++){
			c = ((c&1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1));
		}
		crcTable[n] = c;
	}
	return crcTable;
}

var crc32 = function(data) {
	var crcTable = window.crcTable || (window.crcTable = makeCRCTable());
	var crc = 0 ^ (-1);

	for (var i = 0; i < data.length; i++ ) {
		crc = (crc >>> 8) ^ crcTable[(crc ^ data[i]) & 0xFF];
	}

	return (crc ^ (-1)) >>> 0;
};

const readAsArrayBuffer = async (blob) => {
	const fileReader = new FileReader();
	return new Promise((resolve, reject) => {
		fileReader.onerror = () => {
			fileReader.abort();
			reject(new DOMException("Error parsing data"));
		};

		fileReader.onload = (e) => {
			resolve(e.target.result);
		};

		fileReader.readAsArrayBuffer(blob);
	});
};

function applyIps(rom, patch) {
	const big = false;
	let offset = 5;
	const footer = 3;
	const view = new DataView(patch.buffer);
	while (offset + footer < patch.length) {
		const dest = (patch[offset] << 16) + view.getUint16(offset + 1, big);
		const length = view.getUint16(offset + 3, big);
		offset += 5;
		if (length > 0) {
			rom.set(patch.slice(offset, offset + length), dest);
			offset += length;
		} else {
			const rle_length = view.getUint16(offset, big);
			const rle_byte = patch[offset + 2];
			rom.set(Uint8Array.from(new Array(rle_length), () => rle_byte), dest);
			offset += 3;
		}
	}
}

Vue.component('file-uploader', {
	data: function() {
		return {
			selectedFile: null
		}
	},
	methods: {
		upload: async function(event) {
			if (this.selectedFile == null) {
				alert("You must select a file first");
				return;
			}

			let fileData = null;

			try {
				fileData = new Uint8Array(await readAsArrayBuffer(this.selectedFile));
			} catch (err) {
				alert("Could not read uploaded file data", err);
				return;
			}

			/* Strip header if found */
			if(fileData.length % 0x200 !== 0)
			{
				fileData = fileData.slice(0x200, fileData.length);
			}

			let crc = crc32(fileData);
			if(crc.toString(16).toUpperCase() !== this.manifest.base.crc.toUpperCase()) {
				alert("The selected file's checksum does not match the expected value; try with another file.");
				return;
			}

			try {
				await localforage.setItem('baseRom' + this.manifest.base.crc, new Blob([fileData]));
			} catch (err) {
				alert("Could not store file to localforage: ", err);
				return;
			}

			this.$emit('file-uploaded');
		},
		fileSelected: function(event) {
			this.selectedFile = event.target.files[0];
		}
	},
	props: ['manifest'],
	template: `
	<div class="patchdiv">
		<template v-if="manifest !== null">
			<div class="patch-header">{{ manifest.name }} - {{ manifest.version }}</div>
			<div class="patch-body">
				<p>Select your <i>{{ manifest.base.name }}</i> ROM with CRC <strong>{{ manifest.base.crc }}</strong>
				<div class="custom-file">
						<input type="file" class="chooserom" id="selected-file" @change="fileSelected" />
				</div>
				<button type="button" v-on:click="upload">Use selected ROM</button>
			</div>
		</template>
	</div>
	`
});

Vue.component('file-downloader', {
	data: function() {
		return {
			options: {}
		}
	},
	created: async function() {
		this.manifest.configurations.map((conf) =>  { this.options = {...this.options, [conf.id]: conf.options[0].id}});
	},
	props: ['manifest'],
	methods: {
		download: async function(event) {
			try {
				const patch = this.manifest.patches.find((item) => { return Object.keys(this.options).every(field => item[field] == this.options[field]) });
				const patchData = new Uint8Array(await (await fetch(patch.file, { cache: 'no-store' })).arrayBuffer());
				const baseRom = new Uint8Array(await readAsArrayBuffer(await localforage.getItem('baseRom' + this.manifest.base.crc)));

				let fileName = null;

				if (patch.version.toUpperCase() === "OLD") {
					fileName = this.manifest.name + "-v13.6.0-snapshot.sfc";
				} else {
					fileName = this.manifest.name + "-v" + this.manifest.version;

					if (patch.version.toUpperCase() === "RANDO") {
						fileName = fileName + "-rando";
					}

					fileName = fileName + ".sfc";
				}

				let expandedRom = null;

				if(patch.file.endsWith(".ips")) {
					expandedRom = new Uint8Array(baseRom.length * 2);
					expandedRom.set(baseRom);
					applyIps(expandedRom, patchData);
				} else if(patch.file.endsWith(".bps")) {
					const bps = new BPS();
					bps.setPatch(patchData);
					bps.setSource(baseRom);
					expandedRom = bps.applyPatch();
				}

				if(expandedRom !== null) {
					saveAs(new Blob([expandedRom]), fileName);
				} else {
					alert("Could not create patched file.");
				}
			} catch (err) {
				console.log(err);
			}
		}
	},
	template: `
	<div class="patchdiv">
		<template v-if="manifest !== null">
			<div class="patch-header">{{ manifest.name }} v{{ manifest.version }}</div>
			<div class="patch-body">
				<template v-for="configuration in manifest.configurations">
					<div class="choosev">
						<label for="version">Version:</label>
						<select name="version" v-model="options[configuration.id]" :id="configuration.id" >
							<option v-for="option in configuration.options" :id="option.id" :value="option.id">{{ option.name }}</option>
						</select>
					</div>
				</template>
				<button v-on:click="download" type="button">Save ROM</button>
			</div>
		</template>
	</div>
	`
});

Vue.component('patcher', {
	data: function() {
		return {
			manifest: null,
			file: null,
		}
	},
	mounted: async function() {
		 /* Load manifest data */
		 let response = await fetch(this.manifestPath, { cache: 'no-store' });
		 let json = await response.json();
		 this.manifest = json;
		 this.file = await localforage.getItem('baseRom' + this.manifest.base.crc);
	},
	methods: {
		fileUploaded: async function() {
			let fileData = await localforage.getItem('baseRom' + this.manifest.base.crc);
			this.file = fileData;
		}
	},
	props: ['manifest-path'],
	template: `
		<div>
			<template v-if="manifest">
				<file-downloader v-if="file" :manifest="manifest" />
				<file-uploader v-else-if="file == null" :manifest="manifest" v-on:file-uploaded="fileUploaded" />
				</template>
			<template v-else-if="manifest == null">
				<h3>Loading patch information...</h3>
			</template>
		</div>
	`
});

var app = new Vue({
	el: '#patcher-app'
});
