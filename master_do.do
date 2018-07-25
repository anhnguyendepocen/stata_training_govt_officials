
	clear

	* User identification
	if "`c(username)'" == "Sakina" {
		global dropbox	"C:\DB Mount\Dropbox\DIME_work"
		global github	"C:\Users\Sakina\Documents\GitHub"
		}

	* file path
	global data "$dropbox\minagri_stata_training_aug2018\data"
	global script "$github\stata_training_govt_officials"
	
	* packagess
	global install   0 // Turn to 1 here if you want to install
	if $install == 1 {
		ssc install texdoc, replace
		net from http://www.stata-journal.com/production
		net install sjlatex, replace
		}
	*copy http://www.stata-journal.com/production/sjlatex/stata.sty stata.sty	
		
	texdoc do "$script\stata_workshop_for_govt_officials.do"
	
	
	shell pdflatex "$script\test.tex"
