/*******************************************************************************
Do-file: openingdo.do
Project: Health Research
Author: Gemini
Date: 2025-10-01

Purpose: This do-file is for cleaning, preparing, and analyzing health and 
economic data for the health research project. It includes steps for importing 
data, renaming and labeling variables, and performing initial analysis.

*******************************************************************************/

/*==============================================================================
I. SETUP
   - Setting up the environment
   - Directory management
   - Logging
==============================================================================*/

* Display the current working directory
pwd

/* 
It is better to use absolute paths to make the script more portable.
The following commands navigate the file system. 
This is not recommended in a do-file for reproducibility.
*/
cd ..
dir
cd documents
cd stata_scripts
cd "kaggle_health care dataset"
mkdir health_research
cd health_research

* Start a log file to record commands and output. 
* The `replace` option will overwrite the log file if it already exists.
log using health, replace

/*==============================================================================
II. DATA IMPORT
    - Importing data from Excel and CSV files.
==============================================================================*/

* Display help for importing excel files
h import excel

* Import data from an Excel file. 
* The `firstrow` option indicates that the first row of the Excel file contains variable names.
* The `clear` option clears the memory before loading the new data.
import excel using "C:\Users\LENIVO\Documents\Data_Sources\r_data.xlsx", firstrow clear

* The following command was likely used to import a CSV file.
* import delimited using "healthcare_dataset.csv", clear

/*==============================================================================
III. DATA EXPLORATION AND CLEANING
     - Browsing, editing, and cleaning the data.
==============================================================================*/

* The following commands are useful for interactively exploring the data.
* `br`: browse the data
* `ed`: edit the data
* `cl`: clear the log
* `h cl`: help for clear
* `list [, table]`: list the data in a table format
* `clear`: clear the data from memory

/*
br
ed
cl
h cl
list [, table]
clear
*/

/*==============================================================================
IV. VARIABLE MANAGEMENT
    - Renaming and labeling variables.
==============================================================================*/

* The following section renames and labels variables for clarity.

* Rename a variable. The original command was incomplete.
* `rename LFPat_rate new_name`

* Label variables to provide descriptive names.
label variable year "Fiscal Year"
label variable gdpin "GDP in Leones"
label variable gdppercapita "GDP per Capita USD"
label variable gee_pof_gdpdf "Govt Edu Exp % of GDP"
label variable LFPat_rate "Labor Force Partcipation Rate"
label variable ghe_pof_gdp "Govt Health Exp % of GDP"

* The following command attempts to rename multiple variables at once.
* The original command had invalid new variable names.
* `rename (gdpin, gdppercapita, gee_pof_gdpdf, LFPat_rate) (gdp_sll, gdpcapita, gee, lf)`

* Rename variables one by one.
rename gdpin gdple
rename gdppercapita gdpcapita
rename gee_pof_gdpdf gee
rename LFPat_rate lf

/*==============================================================================
V. DATA FORMATTING
   - Changing data types and formats.
==============================================================================*/

* Format variables for better readability.
format %4.2f gdpcapita
format %3.2f gee
format %3.2f ghe_pof_gdp

* The following command had an invalid format. `F` should be `f`.
* `format %3.2F lf`
format %3.2f lf


/*==============================================================================
VI. TIME SERIES ANALYSIS
    - Graphing and testing for unit roots.
==============================================================================*/

* Set the time variable for time series analysis.
tsset year, yearly

* Create a line graph of gdp over time.
twoway line gdple year

* Create a line graph of gdp per capita over time.
twoway line gdpcapita year

* Perform unit root tests to check for stationarity.
* Dickey-Fuller GLS test
dfgls gdpcapita

* Dickey-Fuller test
dfuller gdpcapita

* Phillips-Perron test
pperron gdpcapita

* The following command is likely for an Augmented Dickey-Fuller test.
* `adftest gdpcapita, adflags(0)`

/*==============================================================================
VII. FURTHER DATA CLEANING AND ANALYSIS
     - Additional data cleaning and analysis steps.
==============================================================================*/

* The following commands seem to be for a different dataset.
* They are kept here for reference.

* Drop a row if the age_group is "age group".
* `drop if age_group == "age group"`

* Convert string variables to numeric.
* `destring female_count, replace`
* `destring male_count, replace`

* Create a bar graph of male and female counts by age group.
* `graph bar (sum) male_count (sum) female_count, over(age_group, gap(0))`
* `yscale(reverse)`

* Perform a regression analysis.
* `regress gdppercapita ghe_pof_gdp gee_pof_gdp LFPat_rate`

* Count missing values.
* `count if gee_pof_gdp < .`

/*==============================================================================
VIII. NOTES ON STATA SYNTAX
      - Comments and other syntax notes.
==============================================================================*/

* Use `*` or `//` for single-line comments.
* Use `///` to continue a command on the next line.
* Use `/* ... */` for multi-line comments.

/*==============================================================================
IX. NON-STATA CODE
   - The following code is not valid Stata code and is commented out.
==============================================================================*/

/*
function example(n)
{
	for (i=i; i<=n; i++){
		printf("i=%g\n", i)
	}
	printf("done\n")
}

example(3)
*/

/*==============================================================================
X. SAVING AND EXITING
   - Saving the modified data and closing the log.
==============================================================================*/

* Save the cleaned data to a new file.
save "C:\Users\LENIVO\Documents\STATA_Scripts\health_research\mainfile.dta", replace

* Close the log file.
log close

* End of do-file.
exit, clear