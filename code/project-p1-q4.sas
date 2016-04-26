/* Part 1 - Question 4 */
proc import datafile="W:stat512/data/project.csv" out=dataset dbms=csv replace;
	getnames=yes;
run;
title1 'Part 1 - Question 4';
proc print data=dataset; run;



