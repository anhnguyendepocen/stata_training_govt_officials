
/* We are using the EICV dataset to learn more about Stata .
This was created in August 2018 */


clear all

global data "C:\Users\Sakina\Desktop"
* Use the dataset

use "$data\cs_s0_s5_household.dta", clear

keep hhid province district ur2012 s5cq2 s5cq4 s5cq8 s5cq15 ///
	 s5cq23 s5bq2 s5cq22 s5cq13 s5cq17 
	 
drop province s5bq2 s5cq17 s5cq15 // We do not need these variables

* Renaming variables
rename ur2012 	urban_2012
rename s5cq2 	m_main_ws
rename s5cq4 	m_used_ws
rename s5cq8 	m_drink_ws
rename s5cq13 	earnings_sell_w
rename s5cq22 	d_affected_dis
rename s5cq23	dis_type

generate  cm_main_ws = m_main_ws*100			

generate  d_closest_ws	 = 0

replace d_closest_ws = 1 if m_main_ws == m_used_ws

label variable cm_main_ws "Cm to main water source"
label variable d_closest_ws "Closest water source is used water source" 

label define yes_no_lb 1 "Yes" 0 "No"
label values d_closest_ws yes_no_lb


gen km_main_ws = m_main_ws/1000
*label variable km_main_ws "Km to main water source"





save "$data\cs_s0_s5_household_modified.dta", replace
export excel using "$data\cs_s0_s5_household_modified.xls", ///
replace firstrow(variable)

graph box m_drink_ws

histogram m_drink_ws, ///
title("Distribution of the Distance to Drinking Water (metres)")




