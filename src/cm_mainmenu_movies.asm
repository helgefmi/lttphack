; MOVIES {{{

cm_main_goto_movies:
	%cm_submenu("Movies", cm_submenu_movies)

cm_submenu_movies:
	dw cm_movie_1
	dw cm_movie_2
	dw cm_movie_3
	dw cm_movie_4
	dw cm_movie_5
	dw cm_movie_6
	dw cm_movie_7
	dw cm_movie_8
	dw cm_movie_9
	dw cm_movie_10
	dw cm_movie_11
	dw cm_movie_12
	dw cm_movie_13
	dw cm_movie_14
	dw cm_movie_15
	dw cm_movie_16
	dw !menu_end
	%cm_header("MOVIES")

cm_movie_1:
	%cm_movie("Movie 01 (0000 bytes)", 0)

cm_movie_2:
	%cm_movie("Movie 02 (0000 bytes)", 1)

cm_movie_3:
	%cm_movie("Movie 03 (0000 bytes)", 2)

cm_movie_4:
	%cm_movie("Movie 04 (0000 bytes)", 3)

cm_movie_5:
	%cm_movie("Movie 05 (0000 bytes)", 4)

cm_movie_6:
	%cm_movie("Movie 06 (0000 bytes)", 5)

cm_movie_7:
	%cm_movie("Movie 07 (0000 bytes)", 6)

cm_movie_8:
	%cm_movie("Movie 08 (0000 bytes)", 7)

cm_movie_9:
	%cm_movie("Movie 09 (0000 bytes)", 8)

cm_movie_10:
	%cm_movie("Movie 10 (0000 bytes)", 9)

cm_movie_11:
	%cm_movie("Movie 11 (0000 bytes)", 10)

cm_movie_12:
	%cm_movie("Movie 12 (0000 bytes)", 11)

cm_movie_13:
	%cm_movie("Movie 13 (0000 bytes)", 12)

cm_movie_14:
	%cm_movie("Movie 14 (0000 bytes)", 13)

cm_movie_15:
	%cm_movie("Movie 15 (0000 bytes)", 14)

cm_movie_16:
	%cm_movie("Movie 16 (0000 bytes)", 15)

; }}}