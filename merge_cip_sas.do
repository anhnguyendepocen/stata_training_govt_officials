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

	
	* Clean sas
	do "$dofile\clean_sas.do"
	
	* Clean cip
	do "$dofile\clean_cip.do"
	
	* Merge all datasets
	