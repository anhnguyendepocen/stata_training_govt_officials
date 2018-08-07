/* This is part of merge_cip_sas do file, and cleans the cip dataset. 

	This clean up follows the do file written by Eric Buramba from NISR.*/

	/*clear

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
	
	* Cleaning the cip for merging
	insheet using "$data_eric\sas_plot_2014_2016_cip.csv", clear
	rename *,lower // make all variables lower cases
	
	count // 431,756 cases in dataset
	
	* Importing tract_numb2 from tract.dta
	replace tract_lett="CV" if segment_id==351104 & season=="A, 2016" & tract_lett=="C V" & tract_numb==100
	merge m:1 tract_lett using "$data_eric\tracts" // SS: This using data is new from eric.
	keep if _merge==3

	* Check for discrepancies between tract_numb and tract_numb2
	gen diff= tract_numb- tract_numb2
	*br if diff!=0 // 5 unmatched cases to be dropped
	drop if diff!=0
	drop diff _merge tract_numb2
	count // 431751 cases in dataset SS: It was actually 431,752. 
	
	* Check duplicates from segmentid tract_id and  plotid
	sort season segment_id tract_numb  plot_id 
	duplicates tag segment_id tract_numb plot_id season , g(dup)
	count if dup>0 // there ARE 131452 duplicates. 65726 duplicated unique obs.
	duplicates report segment_id tract_numb plot_id season // This is just showing the same thing as dup
	
	duplicates drop segment_id tract_numb plot_id season,force // remaining 366025 unique cases. Actually 366,026. 
	drop dup
	
	* Make a season variable
	rename season season_old
	gen season = substr(season_old, 1, 1)
	
	* Make a year variable
	gen year = substr(season_old, strpos(season_old, "2"), 4)
	destring year, replace
	
	* Make a general tract id 
	gen tractid=string(segment_id)+string(tract_numb,"%03.0f") // SS: This is important for clean merge.
	destring tractid, replace
	format tractid %16.0g
	duplicates tag tractid plot_id season year, g(dup)
	tab dup // no duplicates
	drop dup
				
	/* Eric: Check if the tracts_id equals the ones reported in SAS SEASON A 2016 REPORT
	preserve
		duplicates drop tractid, force
		count // Finally there are 25346 tracts id as reported in in SAS SEASON A 2016 REPORT on page 1 use link below 	
			  //http://statistics.gov.rw/publication/seasonal-agricultural-survey-report-season-2016
	restore
	SS: Eric is just counting the number of unique operators here. 
	*/
	
	* Destring the strata id <- This is irrelevant now. 
	tempvar temp
	gen `temp' = subinstr(strata, ".", "", 1)
	destring `temp', replace
	drop strata
	clonevar strata = `temp'
	
	tempfile clean_cip
	save `clean_cip'
	
	

