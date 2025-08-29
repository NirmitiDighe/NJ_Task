# NJ_Task
Analysis and Visualization
1.
a) I extracted the data from the resources given, since there were three files provided : The data for the Title1 schools is provided in a pdf format therefore at first converted the datafile into excel and then to csv. I disabled the automatic data transformations for the data file to preserve column integrity (leading zeroes in codes, identifier consistency). Further for the enrollment 2024/2025 file there were three excel sheets within for which I chose the school file specifically since that file is the one needed for addressing the analysis questions. I made sure the extracted datafiles are in csv format to ensure processing and importing it in MySQL.

b) I created relational tables for the data to be handled in MySQL. I proceeded first with importing the datafiles in MySQL and updating the tables with the preferred columns for the analysis for the tables that are extracting the CSV files (Enrollment, Directory of Schools, Title I Districts). Further I used SQL queries to merge and join these datasets into a view. This view made me analyze grade 5-8 student enrollment at the county, district, and school level specifically for Title I schools. Further I exported this view table into a csv file and uploaded it to my google looker studio to further my analysis in visualizing. 

c) Languages and tools used for analysis include : MySQL and Google looker studio. I used MySQL for merging the datasets and used google looker studio for visualization purposes.

d) I had challenges post importing the data in the table wherein, I had not replaced the comma separated in between the numbers for the Title I allocation column. Values contained commas within the numbers (example: “1234,1234”). Since the column was initially defined as an integer type, MySQL interpreted these values as invalid and stored them as 0. To resolve this, I modified the column type to VARCHAR, re-imported the data, and then used string cleaning functions (REPLACE) to remove commas before converting the field back to INT. This ensured the allocation values were correctly stored as numeric values for further aggregation and analysis.

2. Two key takeaways include:
With the first visualization JerseySTEM can evaluate where their STEM programs can be instilled into based on the number of students from grade 5 to grade 8 in different counties. It showcases where the STEM programs can be provided for example the counties where students are less they can promote and instill the programs to broaden their knowledge.
Based on the number of students in the school in specific districts describes the maximum students who are from grade 5 to grade 8 in a particular school therefore the school level stack visualization describes which schools the JerseySTEM programs and events can be introduced or upgraded. 

