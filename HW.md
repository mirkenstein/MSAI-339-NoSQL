### MongoDB Homework
All 3 questions are on  db collection `sample_mflix.embedded_movies`
To load the sample database follow the instructions here [https://github.com/mirkenstein/MSAI-339-NoSQL/blob/master/Mongo/README_ATLAS.md](https://github.com/mirkenstein/MSAI-339-NoSQL/blob/master/Mongo/README_ATLAS.md)

1. Write a  query  which captures all 3 requirements:
  a. Movies with `year` between 1975 and 1980
  b. Display only 3 columns `title`,`year`, `runtime`
  c. Order by runtime (asc or desc)
  d. Return  top 5 results and submit as part of your homework.

Return results would look like  this
```csv 
title,year,runtime
The Terminator ,1980, 120
```
Helpful documentation  
 

https://www.mongodb.com/docs/v3.0/tutorial/project-fields-from-query-results/#return-the-specified-fields-and-the-id-field-only

https://www.mongodb.com/docs/manual/reference/operator/query/lte/#perform-an-update-based-on-embedded-document-fields

2. Write an aggregation aggregating `year` which calculates sum of all `runtime` for movies where `year` is between  1975 and 1980 including.
 
 Helpful documentation
  
https://www.mongodb.com/docs/manual/aggregation/

Return results would look like  the 
```csv
year,sumRuntime
1975,1234
```
### Spark Databriks
Evey cluster in databricks hase access to preloaded datasets.

The dataset `/databricks-datasets/adult/adult.data` is part of that preloaded collection.

See the documentation for sample datasets https://docs.databricks.com/en/dbfs/databricks-datasets.html

and the notebook demo discusseds in class https://github.com/mirkenstein/MSAI-339-NoSQL/tree/master/data-pipelines/Spark-Databricks#sample-datasets

1. Read into a dataframe the sample dataset `/databricks-datasets/adult/adult.data` 
2. Display top 5 rows ordered ins ascending order by `age` and ascenidng order by `education_num`.

Submit the 5 rows from the result in point 2 as part of your homework submition

Helpful documentation
Cnfigure cluster -> https://docs.databricks.com/en/clusters/configure.html

Import notebook -> 
https://docs.databricks.com/en/notebooks/notebook-export-import.html
