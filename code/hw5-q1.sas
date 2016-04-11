/* Question 1 */
data cs;
	infile 'W:stat512/data/csdata.dat';
	input id gpa hsm hss hse satm satv gender;

title1 'Question 1';
title2 'by Gray Houston';

/* part a.) */
data cs_sat;
	set cs;
	sat = satm + satv;

title3 'Regression: GPA = HSM HSS HSE';
proc reg data=cs_sat;
	model gpa = hsm hss hse;
run;

title3 'Regression: GPA = SAT HSM HSS HSE';
proc reg data=cs_sat;
	model gpa = sat hsm hss hse;
run;

/* part b.) */
title3 'Full Model testing without SAT';
proc reg data=cs_sat;
	model gpa = sat hsm hss hse /ss1 ss2;
	noSAT: test sat;
run;

/* part c.) */
title3 'Regression: GPA = SAT HSM HSS HSE';
proc reg data=cs_sat;
	model gpa = sat hsm hss hse;
run;

