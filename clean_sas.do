/* This is part of merge_cip_sas do file, and cleans the SAS dataset. 

	!! I'm currently only cleaning the 
	
	clear

	if c(username) == "WB506744" {
		global dropbox "C:\Users\WB506744\Dropbox\DIME_work"
		}

	if c(username) == "Sakina" {
		global dropbox "C:\DB Mount\Dropbox\DIME_work"
		}
		
	global data			"$dropbox\CIP Evaluation\data"
	global data_eric	"$data\drop_off_spot\Data_NISR_Eric"	
	global dofile		"$dropbox\CIP Evaluation\dofiles"
*/
	
	use "$data\2016\STATA\B\farmq_part0.dta", clear
	rename id3 strata // to match with the cip data
	duplicates report strata tractid
	assert `r(unique_value)' == `r(N)'
	tempfile part0_cleaned
	save `part0_cleaned'	
	// This is at the operator level and does not have plot ID.
	
	use "$data\2016\STATA\B\farmq_part1.dta", clear	
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	rename b1 plot_id // to match with the cip data
	duplicates report strata tractid plot_id c03a
	assert `r(unique_value)' == `r(N)'
	tempfile part1_cleaned
	save `part1_cleaned'
	// This is at the operator-plot level
		
	use "$data\2016\STATA\B\farmq_part2a.dta", clear	
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	rename plot_no plot_id // to match with the cip data	
	duplicates drop strata tractid plot_id ui03d, force
	duplicates report strata tractid plot_id ui03d
	assert `r(unique_value)' == `r(N)'
	tempfile part2a_cleaned
	save `part2a_cleaned'		
	// This is at the operator-plot level
	
	use `part0_cleaned', clear
	merge 1:m strata tractid using `part1_cleaned', gen(merge1)
	drop if _merge != 3
	merge m:m strata tractid plot_id using `part2a_cleaned', gen(merge2)
exit	
	

	use "$data\2016\STATA\B\farmq_part2b.dta", clear	
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	rename pp7a plot_id // to match with the cip data	
	duplicates drop strata tractid plot_id pp10 pp1a pp7, force
	duplicates tag strata tractid plot_id pp10 pp1a pp7, gen(dup)
	assert `r(unique_value)' == `r(N)'
	tempfile part2b_cleaned
	save `part2b_cleaned'
	// This is at the operator-plot level
		
	use "$data\2016\STATA\B\farmq_part3.dta", clear	
	duplicates report tractid q3_1
	assert `r(unique_value)' == `r(N)'
	tempfile part3_cleaned
	save `part3_cleaned'
	// This data set is at the operator-crop level. NOT at the plot level.

	use "$data\2016\STATA\B\farmq_part4.dta", clear
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	duplicates report strata tractid c03c
	assert `r(unique_value)' == `r(N)'
	tempfile part4_cleaned
	save `part4_cleaned'	
	// This data set is at the operator-crop level. NOT at the plot level.	
	
	use "$data\2016\STATA\B\farmq_part6a.dta", clear	
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	duplicates drop strata tractid uic1 uic3 uic4 uic5 uic5 uic7, force
	duplicates report strata tractid uic1 uic3 uic4 uic5 uic5 uic7
	assert `r(unique_value)' == `r(N)'
	tempfile part6a_cleaned
	save `part6a_cleaned'	
	
	use "$data\2016\STATA\B\farmq_part6b.dta", clear	
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	duplicates report strata tractid udl1
	assert `r(unique_value)' == `r(N)'
	tempfile part6b_cleaned
	save `part6b_cleaned'	

	use "$data\2016\STATA\B\farmq_part7.dta", clear	
	rename strate strata // to match with the cip data
	destring strata, replace
	replace strata = 3 if strata == 30
	
	duplicates report strata idquest crop_codg
	assert `r(unique_value)' == `r(N)'
	tempfile part7_cleaned
	save `part7_cleaned'	

	
	foreach x in 0 1 2a 2b 3 4 6a 6b 7 {
		use "$data\2016\STATA\B\farmq_part`x'.dta", clear
		count
		di "`x': `r(N)'"
		}

	
	

	