/* Question 3 */
data d1;
	infile 'H:stat512/data/CH01PR19.dat';
	input gpa actScore;
	id = _N_;

title1 'ACT Score Study';
title2 'GPA = ACTSCORE Regression';
title3 'by Gray Houston';
proc reg data=d1;
	model gpa = actScore;
	output out=resid
		r = gparesid;
run;

/* Part a.) */
proc univariate data=resid; var gparesid; run;

/* Part b.) */
proc sort data=resid; by actScore; run;
symbol v=circle i=sm70;
title2 'Plotting Residual vs. Explanatory Variable: sm70';
title3 'by Gray Houston';
axis1 label=(angle=90 'Residual');
axis2 label=('ACT Scores');
proc gplot data=resid;
	plot gparesid * actScore / haxis=axis2 vaxis=axis1;
run;*/

/* Part c.) */
proc sort data=resid; by id; run;
title2 'Residual vs. Order';
title3 'by Gray Houston';
axis1 label=('Order in dataset');
axis2 label=(angle=90 'Residual');
proc gplot data=resid;
	plot gparesid * id / haxis=axis1 vaxis=axis2;
run;

/* Part d.) */
title2 'Distribution of Residuals';
title3 'by Gray Houston';
proc univariate data=resid plot normal;
	var gparesid;
	histogram gparesid / normal kernel(L=2);
	qqplot gparesid / normal (L=1 mu=est sigma=est);
run;


