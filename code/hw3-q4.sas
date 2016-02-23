/* Question 4 */
data d1;
	infile 'H:stat512/data/CH01PR19.dat';
	input gpa actScore;
	id = _N_;
	if _N_ eq 120 then gpa = 29.48;

/* Part a.) */
title1 'Enzymatic Reaction Study';
title2 'Altered Data Information';
title3 'by Gray Houston';
proc reg data=d1;
	model gpa = actScore;
run;
