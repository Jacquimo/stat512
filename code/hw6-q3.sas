/* Question 3 */
data cs;
	infile 'W:stat512/data/csdata.dat';
	input id gpa hsm hss hse satm satv gender;

title1 'Question 3';
title2 'by Gray Houston';

title3 'Regresion: GPA = HSM HSS HSE SATM SATV GENDER / selection = cp b';
proc reg data = cs;
	model gpa = hsm hss hse satm satv gender / selection = cp b;
run;

