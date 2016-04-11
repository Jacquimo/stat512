/* Question 4 */

data d1;
	infile 'H:stat512/data/ch06pr18.dat';
	input salary quality exper publish;
	id = _N_;

title1 'Question 4';
title2 'by Gray Houston';
title3 'Salary = Quality, Experience, and Publishing';
proc reg data=d1 alpha=.06;
	model salary = quality exper publish;
run;


