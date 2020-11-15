cd "C:\Users\jackr\Desktop\School\Fall 2020\Stata\Cycling to School"
set more off

use "bh_enroll_data_reg.dta", clear

/* Generate the variables we will be using */

generate logenrollment = log(enrollment)

generate n_year = year-2002
/* Year is a variable that exists in bh_enroll_data_reg already */

generate female_year = n_year*female

generate female_state = female*treat

generate state_year = treat*n_year

generate female_year_state = female*year*treat

/* Regressions for the Table 1 Panel A */

reg logenrollment female_year female n_year if class == 9 & statecode == 1, robust cluster(district_code)
estimates store a1

/* Checking if class is grade 9 and that the state is Bihar, I believe*/

outreg2 [a*] using "C:\Users\jackr\Desktop\School\Fall 2020\Stata\Cycling to School\Original Code\Generated Tables\Table-1-Panel_A.xls", dec(3) replace

/* Unsure of the dec, not sure what that does, but essentially, it takes the 
estimate regression we just made and puts it in a folder and replaces it if it 
already exists */

/* Regressions for Table 1 Panel B, using data from Jharkhand as well */

reg logenrollment female_year_state female_year female_state state_year female n_year treat if class == 9, robust cluster(district_code)
estimates store b1

outreg2 [b*] using "C:\Users\jackr\Desktop\School\Fall 2020\Stata\Cycling to School\Original Code\Generated Tables\Table-1-Panel_B.xls", dec(3) replace