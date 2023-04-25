/* Analysis */
proc import out=RUC datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPB.xlsx"
dbms=xlsx replace; 
sheet="FinalSheet_QualityScoreMSPBUrba";
run;

/* Numeric Summary */
proc means data=RUC n mean median std min max cv maxdec=2;
	var MSPBscore;
	class Hospital_overall_rating;
run;

/* Boxplot */
proc sgplot data=RUC;
	vbox MSPBscore/category=Hospital_overall_rating;
	title "MSPB scores by Hospital Star Ratings";
run;

proc sgplot data=RUC;
	vbox RUCA1/category=Hospital_overall_rating;
	title "Hospital Star Ratings by RuralUrban Continuum Codes";
run;	

/* Histogram */
proc sgplot data=RUC;
	histogram MSPBscore/group=Hospital_overall_rating;
	title "MSPB scores by Hospital Star Ratings";
run;	

/* Correlation Matrix */
proc corr data=RUC;
	var Hospital_overall_rating MSPBscore MORTGrpMeasureCount CountFacilityMORT SafetyGrpMeasureCount 
	CountFacilitySafety READMGrpMeasureCount CountFacilityREADM PtExpGrpMeasureCount TEGrpMeasureCount 
	CountFacilityTE RUCA1 costIndex;
run;

proc freq data=RUC;
	table hospital_type state county_name;
run;

proc means data=RUC n mean median std min max cv maxdec=2;
	var MSPBscore Hospital_overall_rating costIndex CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE;
run;

/* Boxplot */
proc sgplot data=RUC;
	vbox costIndex/category=Hospital_overall_rating;
	title "Cost of Index by Hospital Star Ratings";
run;

proc sgplot data=RUC;
	histogram costIndex/group=Hospital_overall_rating;
	title "Cost of Index by Hospital Star Ratings";
run;	

proc hpreg data=RUC seed=12345;
	model Hospital_overall_rating=EmergencyServices MSPBscore CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 1 */
proc import out=RUC1 datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPBRUC1.xlsx"
dbms=xlsx replace; 
sheet="FinalSheet_QualityScoreMSPBUrba";
run;

proc hpreg data=RUC1 seed=12345;
	model Hospital_overall_rating=EmergencyServices MSPBscore CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 2 */
proc import out=RUC2 datafile="/home/u62188546/sasuser.v94/Capstone/RUC2value.xlsx"
dbms=xlsx replace;
run;

proc hpreg data=RUC2 seed=12345;
	model Hospital_overall_rating=score CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 3 */
proc import out=RUC3 datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPBUrbanRuralCode3.xlsx"
dbms=xlsx replace;
run;

proc hpreg data=RUC3 seed=12345;
	model Hospital_overall_rating=score CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 4 */
proc import out=RUC4 datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPBRUC4.xlsx"
dbms=xlsx replace; 
sheet="FinalSheet_QualityScoreMSPBUrba";
run;

proc hpreg data=RUC4 seed=12345;
	model Hospital_overall_rating=EmergencyServices MSPBscore CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 5 */
proc import out=RUC5 datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPBUrbanRuralCode5.xlsx"
dbms=xlsx replace; 
sheet="FinalSheet_QualityScoreMSPBUrba";
run;

proc hpreg data=RUC5 seed=12345;
	model Hospital_overall_rating=score CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 7 */
proc import out=RUC7 datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPB_RUC7.xlsx"
dbms=xlsx replace; 
sheet="FinalSheet_QualityScoreMSPBUrba";
run;

proc hpreg data=RUC7 seed=12345;
	model Hospital_overall_rating=EmergencyServices MSPBscore CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;

/* Analysis Based on RUC 10 */
proc import out=RUC10 datafile="/home/u62188546/sasuser.v94/Capstone/FinalSheet_QualityScoreMSPB10.xlsx"
dbms=xlsx replace; 
sheet="FinalSheet_QualityScoreMSPBUrba";
run;

proc hpreg data=RUC10 seed=12345;
	model Hospital_overall_rating=EmergencyServices MSPBscore CountFacilityMORT CountFacilitySafety CountFacilityREADM  
	CountFacilityTE costIndex;
	partition fraction(validate=0.2);
run;