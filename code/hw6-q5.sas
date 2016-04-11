/* Question 5 */
data residences;
	infile 'W:stat512/data/CH08PR24.dat';
	input sellingPrice valuation isCorner;

title1 'Question 5';
title2 'by Gray Houston';

data residences;
	set residences;
	valuationIsCorner = valuation * isCorner;

title3 'Interaction Effects Regression Model';
proc reg data = residences;
	model sellingPrice = isCorner valuation valuationIsCorner;
	SameLine: test isCorner, valuationIsCorner;
run;

