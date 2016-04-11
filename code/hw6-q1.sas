/* Question 1 */
data cs;
	infile 'W:stat512/data/csdata.dat';
	input id gpa hsm hss hse satm satv gender;

title1 'Question 1';
title2 'by Gray Houston';

data cs_genderw;
	set cs;
	genderw = gender - 1;

/* part a.) */
title3 'Regresion: GPA = HSM HSS HSE SATM SATV GENDERW';
proc reg data = cs_genderw;
	model gpa = hsm hss hse satm satv genderw;
run;

