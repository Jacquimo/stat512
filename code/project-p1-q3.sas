/* Part 1 - Question 3 */
proc import datafile="W:stat512/data/project.csv" out=dataset dbms=csv replace;
	getnames=yes;
run;
title1 'Part 1 - Question 3';

/* get rid of rows with missing data and fix datatype issue */
title2 'Altered Dataset';
data dataset_alt;
	set dataset;
	if INF = '*' then delete;
	INF_new = input(INF, 8.);
	drop INF;
	rename INF_new = INF;
run;

title2 'Regression: INF = QUES LEGAL DEV';
proc reg data=dataset_alt;
	model INF = QUES LEGAL DEV /ss1 ss2;
run;
	
