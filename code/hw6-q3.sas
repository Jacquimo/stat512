/* Question 3 */
data cs;
	infile 'W:stat512/data/csdata.dat';
	input id gpa hsm hss hse satm satv gender;
	id = _N_;

title1 'Question 3';
title2 'by Gray Houston';

title3 'Regresion: GPA = HSM HSS HSE SATM SATV GENDER / selection = cp b';
proc reg data = cs;
	model gpa = hsm hss hse satm satv gender / selection = cp b;
	output out = cs_resid r = resid;
run;

title3 'Scatterplot Matrix of CS Data';
proc sgscatter data = cs;
	matrix gpa hsm hss hse satm satv gender;
run;

proc sort data=cs_resid; by hsm;
title3 'Residual vs. HSM';
symbol1 v=G i=sm70 l=1;
proc gplot data = cs_resid;
	plot resid*hsm / vref = 0;
run;

proc sort data=cs_resid; by hse;
title3 'Residual vs. HSE';
symbol1 v=G i=sm70 l=1;
proc gplot data = cs_resid;
	plot resid*hse / vref = 0;
run;

/*
title3 'QQPlot (Normal probability plot)';
proc univariate data = cs plot normal;
	var resid;
	histogram resid / normal kernel (L = 2);
	qqplot gpa hsm hss hse / normal (L=1 mu=est sigma=est);
run;
*/



