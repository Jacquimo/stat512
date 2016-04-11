/* Question 4 */
data residences;
	infile 'W:stat512/data/CH08PR24.dat';
	input sellingPrice valuation isCorner;

title1 'Question 4';
title2 'by Gray Houston';

symbol1 v=N i=sm70 c=black l=1;
symbol2 v=C i=sm70 c=red l=1;

title3 'Symbolic Scatterplots of the Two Populations';
proc sort data=residences; by isCorner valuation;
proc gplot data=residences;
	plot sellingPrice*valuation=isCorner;
run;

