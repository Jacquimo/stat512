data d1;
	infile 'H:stat512/data/CH01PR22.dat';
	input hardness time;

proc sort data=d1;
by time;
run;

* Question 4 part a.);
symbol1 v=square i=rl;
title1 'Plastic Hardness Study';
title2 'Scatter Plot of Time vs. Hardness with Regression Line';
title3 'by Gray Houston';
axis1 label=('Time (hrs)');
axis2 label=(angle=90 'Hardness (Brinell units)');
proc gplot data=d1;
	plot hardness * time / haxis=axis1 vaxis=axis2;
run;

* Question 4 part b.);
title2 'Time vs. Hardness ANOVA Table';
title3 'by Gray Houston';
proc reg data=d1;
	model hardness=time/clb;
run;



