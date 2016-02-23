/* Question 2 */
data d1;
	infile 'H:stat512/data/CH01PR19.dat';
	input gpa actScore;
proc sort data=d1; by actScore; run;

title1 'ACT Score Study';
title2 'Histogram of ACT Scores';
title3 'by Gray Houston';
proc univariate data=d1;
	histogram actScore / normal
						 endpoints=10 to 40 by 2.5;
run;

