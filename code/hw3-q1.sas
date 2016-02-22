/* Question 1 */

data reaction;
	input concentration rate @@;
	cards;
.02 47 .02 76 .06 97 .06 107 .11 123 .11 139 .22 152 .22 159 .56 191 .56 201 1.1 200 1.1 207
;
/*proc print data=reaction; run;*/

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
