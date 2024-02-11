cd "C:\Users\asd74\Dropbox\IDEA\Term II\0_Macro\ps2"
import excel Total.csv
logout, save(Statistic Description) word replace:tabstat inflation-regionnortheast_3 ,stat(N Mean SD Min p25 p75 Max) col(stat) format(%10.3f) 

gen diff_south_one_yr = south - regionsouth_1
gen diff_west_one_yr = west - regionwest_1
gen diff_midwest_one_yr = midwest - regionmidwest_1
gen diff_northeast_one_yr = northeast - regionnortheast_1

gen diff_south_three_yr = south - regionsouth_3
gen diff_west_three_yr = west - regionwest_3
gen diff_midwest_three_yr = midwest - regionmidwest_3
gen diff_northeast_three_yr = northeast - regionnortheast_3
logout, save(diff1) word replace:tabstat diff_south_one_yr-diff_northeast_three_yr ,stat(N Mean) col(stat) format(%10.3f) 

tsset year
reg diff_south_one_yr - diff_northeast_three_yr
estat bgodfrey, lags(1)
estat bgodfrey, lags(2)
estat bgodfrey, lags(3)
estat bgodfrey, lags(4)
//ageunder40_1 age4060_1 ageover60_1
reg ageunder40_3 inflation
estimates store model1
reg age4060_3 inflation
estimates store model2
reg ageover60_3 inflation
estimates store model3
suest model1 model2 model3
test inflation 
 
//educationhighschoolorless_1 educationsomecollege_1 educationbaorhigher_1
reg educationhighschoolorless_3 inflation
estimates store model1
reg educationsomecollege_3 inflation
estimates store model2
reg educationbaorhigher_3 inflation
estimates store model3
suest model1 model2 model3
test inflation  
//numeracylow_1 numeracyhigh_1
reg numeracylow_3 inflation
estimates store model1
reg numeracyhigh_3 inflation
estimates store model2 
suest model1 model2 
test inflation  
//regionwest_1 regionmidwest_1 regionsouth_1 regionnortheast_1 incomeunder50k_1 income50100k_1 incomeover100k_1reg 
reg regionwest_1 inflation 
outreg2 using First.doc, replace tstat bdec(3) tdec(2) ctitle(Exp) 
reg regionmidwest_1 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg regionsouth_1 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg regionnortheast_1 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg incomeunder50k_1 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg income50100k_1 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg incomeover100k_1 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 

reg regionwest_3 inflation
estimates store model1
reg regionmidwest_3 inflation
estimates store model2
reg regionsouth_3 inflation
estimates store model3
reg regionnortheast_3 inflation
estimates store model4
suest model1 model2 model3 model4 
test inflation  

reg incomeunder50k_3 inflation
estimates store model1
reg income50100k_3 inflation
estimates store model2
reg incomeover100k_3 inflation
estimates store model3
suest model1 model2 model3 model4 
test inflation  

//ageunder40_1 age4060_1 ageover60_1
reg ageunder40_3 inflation 
outreg2 using First.doc, replace tstat bdec(3) tdec(2) ctitle(Exp) 
reghdfe age4060_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reghdfe ageover60_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
//educationhighschoolorless_1 educationsomecollege_1 educationbaorhigher_1
reg educationhighschoolorless_3 inflation 
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reghdfe educationsomecollege_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reghdfe educationbaorhigher_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
//numeracylow_1 numeracyhigh_1
reg numeracylow_3 inflation 
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg numeracyhigh_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 


reg regionwest_3 inflation 
outreg2 using First.doc, replace tstat bdec(3) tdec(2) ctitle(Exp) 
reg regionmidwest_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg regionsouth_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg regionnortheast_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg incomeunder50k_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg income50100k_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 
reg incomeover100k_3 inflation
outreg2 using First.doc, append tstat bdec(3) tdec(2) ctitle(Exp) 

//




