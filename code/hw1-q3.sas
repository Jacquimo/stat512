data d1;
	infile 'H:stat512/data/CH01PR19.dat';
	input gpa actScore;

proc sort data=d1; by actScore;
proc print data=d1; run;

* Question 3 part a.);
SYMBOL1 v = square i = sm70;
title1 'ACT Score Study';
title2 'Scatter Plot of ACT Score vs. GPA with Smoothed Curve: sm70';
title3 'by Gray Houston';
axis1 label=('ACT Score (0-32)');
axis2 label=(angle=90 'GPA (0-4.000)');
proc gplot data=d1;
	plot gpa * actScore / haxis=axis1 vaxis=axis2;
run;

* Question 3 part b.) and c.);
title2 'ACT Score vs. GPA ANOVA Table';
title3 'by Gray Houston';
proc reg data=d1 alpha=.06;
	model gpa=actScore/clb;
run;



