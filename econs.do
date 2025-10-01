/*******************************************************************************
Do-file: econs.do
Project: Health Research Econometric Analysis
Author: Hassan S Konneh
Date: 2025-04-01
Updated: 2025-10-01

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

* Display the current working directory to ensure the script is running in the correct location.
pwd

/* 
NOTE: It is better to use absolute paths to make the script more portable.
The following commands navigate the file system. 
This is not recommended in a do-file for reproducibility.
*/
* cd ..
* dir
* cd documents
* cd stata_scripts
* cd "kaggle_health care dataset"
* mkdir health_research
* cd health_research

* Start a log file to record all commands and their output.
* The `replace` option will overwrite the log file if it already exists.
log using "health_analysis.log", replace

/*==============================================================================
II. DATA IMPORT
    - Importing data from Excel and CSV files.
==============================================================================*/

* Display help for importing excel files to understand the command options.
help import excel

* Import data from an Excel file. 
* The `firstrow` option indicates that the first row of the Excel file contains variable names.
* The `clear` option clears any existing data from memory before loading the new data.
import excel using "C:\Users\LENIVO\Documents\Data_Sources\r_data.xlsx", firstrow clear

* Example of importing a CSV file (commented out).
* import delimited using "healthcare_dataset.csv", clear

/*==============================================================================
III. DATA EXPLORATION AND CLEANING
     - Browsing, editing, and cleaning the data.
==============================================================================*/

* The following commands are useful for interactively exploring the data.
* `br`: browse the data in a spreadsheet-like window.
* `ed`: edit the data.
* `cl`: clear the log.
* `h cl`: help for the clear command.
* `list [, table]`: list the data in a table format.
* `clear`: clear the data from memory.

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
    - Renaming and labeling variables for clarity and ease of use.
==============================================================================*/

* The following section renames and labels variables to provide descriptive names.

* Example of renaming a variable (commented out).
* `rename LFPat_rate new_name`

* Label variables to provide descriptive names for better understanding.
label variable year "Fiscal Year"
label variable gdpin "GDP in Leones"
label variable gdppercapita "GDP per Capita USD"
label variable gee_pof_gdpdf "Govt Edu Exp % of GDP"
label variable LFPat_rate "Labor Force Partcipation Rate"
label variable ghe_pof_gdp "Govt Health Exp % of GDP"

* Example of renaming multiple variables at once (commented out due to invalid names).
* `rename (gdpin, gdppercapita, gee_pof_gdpdf, LFPat_rate) (gdp_sll, gdpcapita, gee, lf)`

* Rename variables one by one for better control and readability.
rename gdpin gdple
rename gdppercapita gdpcapita
rename gee_pof_gdpdf gee
rename LFPat_rate lf

/*==============================================================================
V. DATA FORMATTING
   - Changing data types and formats for consistency and readability.
==============================================================================*/

* Format variables for better readability in outputs.
format %4.2f gdpcapita
format %3.2f gee
format %3.2f ghe_pof_gdp
format %3.2f lf

/*==============================================================================
VI. TIME SERIES ANALYSIS
    - Graphing and testing for unit roots to check for stationarity.
==============================================================================*/

* Set the time variable for time series analysis. `yearly` specifies the frequency.
tsset year, yearly

* Create a line graph of GDP over time to visualize the trend.
twoway line gdple year

* Create a line graph of GDP per capita over time.
twoway line gdpcapita year

* Perform unit root tests to check for stationarity of the time series data.
* Dickey-Fuller GLS test for gdpcapita.
dfgls gdpcapita

* Standard Dickey-Fuller test for gdpcapita.
dfuller gdpcapita

* Phillips-Perron test for gdpcapita.
pperron gdpcapita

* Example of an Augmented Dickey-Fuller test (commented out).
* `adftest gdpcapita, adflags(0)`

/*==============================================================================
VII. FURTHER DATA CLEANING AND ANALYSIS
     - Additional data cleaning and analysis steps for reference.
==============================================================================*/

* The following commands are examples for a different dataset and are for reference only.

* Example of dropping a row based on a condition.
* `drop if age_group == "age group"`

* Example of converting string variables to numeric.
* `destring female_count, replace`
* `destring male_count, replace`

* Example of creating a bar graph.
* `graph bar (sum) male_count (sum) female_count, over(age_group, gap(0))`
* `yscale(reverse)`

* Example of a regression analysis.
* `regress gdppercapita ghe_pof_gdp gee_pof_gdp LFPat_rate`

* Example of counting missing values.
* `count if gee_pof_gdp < .`

/*==============================================================================
VIII. NOTES ON STATA SYNTAX
      - Comments and other useful syntax notes.
==============================================================================*/

* Use `*` or `//` for single-line comments.
* Use `///` to continue a command on the next line (for long commands).
* Use `/* ... */` for multi-line comments.

/*==============================================================================
IX. CONTINUING THE ANALYSIS
    - Further exploration and modeling.
==============================================================================*/

* Start a new log file for the continued analysis.
log using "econs_analysis_continued.log", replace

* Display help file for general guidance.
help

* Get detailed summary statistics for specified variables.
summarize gdpin gdppercapita gee_pof_gdp, detail

* Describe the data in memory.
describe

* Summarize gdpin for years greater than 2000.
summarize gdpin if year > 2000

* Describe gdpin for years greater than 2000.
describe gdpin if year > 2000

* Get a codebook of the data, showing detailed information about variables.
codebook

* Check for missing data patterns.
misstable summarize
misstable patterns

* Tabulate the distribution of a variable.
tabulate gee_pof_gdp

* Inspect the distribution of a variable.
inspect gdppercapita

* Calculate the correlation between variables.
correlate gdpin ghe_pof_gdp gee_pof_gdp

* Calculate pairwise correlations with significance levels.
pwcorr gdpin ghe_pof_gdp gee_pof_gdp, sig

* Set the time series variable again (if needed).
tsset year

* Fit an Autoregressive Distributed Lag (ARDL) model.
ardl gdpin ghe_pof_gdp, lags(1,1)

* Fit a Vector Autoregression (VAR) model.
var ghe_pof_gdp gdpin ghe_pof_gdp gee_pof_gdp, lags(1)

* Perform a Granger causality test after a VAR model.
vargranger

/*==============================================================================
X. SAVING AND EXITING
   - Saving the modified data and closing the log.
==============================================================================*/

* Save the cleaned and modified data to a new file for future use.
save "C:\Users\LENIVO\Documents\STATA_Scripts\health_research\mainfile.dta", replace

* Close the log file to save all the output.
log close

* End of the do-file and exit Stata, clearing memory.
exit, clear