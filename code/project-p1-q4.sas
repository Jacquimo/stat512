/* Part 1 - Question 4 */
proc import datafile="W:stat512/data/project.csv" out=dataset dbms=csv replace;
	getnames=yes;
run;
title1 'Part 1 - Question 4';

/* Get rid of rows with missing data, fix datatype issue, and add variable */
title2 'Altered Dataset';
data dataset_alt;
	set dataset;
	if INF = '*' then delete;

	INF_new = input(INF, 8.);
	drop INF;
	rename INF_new = INF;

	SUM = QUES + DEV;
run;
proc print data=dataset_alt; run;

/* Run all these regression models to find model with largest R^2 value */
title2 'Different Regression Models w/ Predictors: QUES, LEGAL, DEV, SUM';
proc reg data=dataset_alt;
	model INF = QUES;
	model INF = LEGAL;
	model INF = DEV;
	model INF = SUM;
	model INF = QUES LEGAL;
	model INF = QUES DEV;
	model INF = QUES SUM;
	model INF = LEGAL DEV;
	model INF = LEGAL SUM;
	model INF = DEV SUM;
	model INF = LEGAL DEV SUM;
	model INF = QUES DEV SUM;
	model INF = QUES LEGAL SUM;
	model INF = QUES LEGAL DEV;
	model INF = QUES LEGAL DEV SUM;
run;


