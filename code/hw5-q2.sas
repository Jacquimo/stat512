/* Question 2 */
data cs;
	infile 'W:stat512/data/csdata.dat';
	input id gpa hsm hss hse satm satv gender;

title1 'Question 2';
title2 'by Gray Houston';
title3 'GPA = SATM SATV HSM HSE HSS /SS1 SS2';

/* a.) */
proc reg data=cs;
	model gpa = satm satv hsm hse hss /ss1 ss2;
run;

/* b.) */
title3 'GPA = SATM SATV';
proc reg data=cs;
	model gpa = satm satv /ss1;
run;

title3 'GPA = SATM';
proc reg data=cs;
	model gpa = satm /ss1;
run;

