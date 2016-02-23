/* Question 4 */
data d1;
	infile 'H:stat512/data/CH01PR19.dat';
	input gpa actScore;
	id = _N_;
