data data4animation;
	input Date :$10. CONFIRMED @@;
	datalines;
04/21/2020 812036 03/31/2020 188172
04/20/2020 784326 03/30/2020 161831
04/19/2020 758809 03/29/2020 140909
04/18/2020 732197 03/28/2020 121465
04/17/2020 699706 03/27/2020 101657
04/16/2020 667592 03/26/2020 83836 
04/15/2020 636350 03/25/2020 65778 
04/14/2020 607670 03/24/2020 53736 
04/13/2020 580619 03/23/2020 43843 
04/12/2020 555313 03/22/2020 33276 
04/11/2020 526396 03/21/2020 25600 
04/10/2020 496535 03/20/2020 19273 
04/09/2020 462780 03/19/2020 13747 
04/08/2020 428654 03/18/2020 7783  
04/07/2020 397121 03/17/2020 6421  
04/06/2020 366317 03/16/2020 4632  
04/05/2020 336802 03/15/2020 3499  
04/04/2020 308650 03/14/2020 2727  
04/03/2020 275367 03/13/2020 2179  
04/02/2020 243622 03/12/2020 1663  
04/01/2020 213242 03/11/2020 1281  
;
run;

proc sort data=data4animation;
	by descending Date;
run;

data new4animation;
	set data4animation;
	retain duration 0;
	i = _n_;
	Do while (i>=1);
		duration = i;
		i = i - 1;
  		newDate = put(input(Date, mmddyy10.) + duration, mmddyy10.); 
		output;
	end;
	drop i duration;
run;
