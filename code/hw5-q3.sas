/* Question 3 */
data cs;
	infile 'W:stat512/data/csdata.dat';
	input id gpa hsm hss hse satm satv gender;

title1 'Question 3';
title2 'by Gray Houston';
title3 'Multiple Model Regressions';

data cs_hs_sat;
	set cs;
	hs = hsm + hss + hse;
	sat = satm + satv;

proc reg data=cs_hs_sat;
	model gpa = satm;
	model gpa = satv;
	model gpa = hsm;
	model gpa = hss;
	model gpa = hse;
	model gpa = satm satv;
	model gpa = sat;
	model gpa = hsm hss hse;
	model gpa = hs;
	model gpa = satm satv hsm hss hse;
	model gpa = sat hs;
run;
	

