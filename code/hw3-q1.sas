/* Question 1 */

data reaction;
	input concentration rate @@;
	cards;
.02 47 .02 76 .06 97 .06 107 .11 123 .11 139 .22 152 .22 159 .56 191 .56 201 1.1 200 1.1 207
;

/* Part a.) */
symbol1 v = circle i = sm70;
title1 'Enzymatic Reaction Rate Study';
title2 'Scatter Plot of Rate (V) vs. Concentration (C): sm70';
title3 'by Gray Houston';
axis1 label=(angle=90 'Concetration (0.0-1.20)');
axis2 label=('Rate (45-210)');
proc gplot data=reaction;
	plot concentration * rate / haxis=axis2 vaxis=axis1;
run;

/* Part b.) */
data altered;
	set reaction;
	vinv = 1 / rate;
	cinv = 1 / concentration;
title2 'Scatter Plot of Inverse Rate (1/V) vs. Inverse Concentration (1/C): sm70';
title3 'by Gray Houston';
axis1 label=('Inverse Rate');
axis2 label=(angle=90 'Inverse Concentration');
proc gplot data=altered;
	plot cinv * vinv / haxis=axis1 vaxis=axis2;
run;

/* Part c.) */
title2 'Distribution of C values';
title3 'by Gray Houston';
proc univariate data=reaction noprint;
	histogram concentration / normal barwidth=5;
run;

title2 'Distribution of 1/C values';
title3 'by Gray Houston';
proc univariate data=altered noprint;
	histogram cinv / normal barwidth=5;
run;

/* Part d.) */
title2 '1/V Regression Line';
proc reg data=altered;
	model vinv = cinv;
	output out=resid
		r = vresid;
run;


