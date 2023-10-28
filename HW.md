### MongoDB Homework
All 3 questions are on  db collection `sample_mflix.embedded_movies`
To load the sample database follow the instructions here [https://github.com/mirkenstein/MSAI-339-NoSQL/blob/master/Mongo/README_ATLAS.md](https://github.com/mirkenstein/MSAI-339-NoSQL/blob/master/Mongo/README_ATLAS.md)

1. Write a  query on which captures all 3 requirements:
  a. Movies `year` between 1975 and 1980
  c. Display only 3 columns `title`,`year`, `runtime`
  b. Order by runtime (asc or desc)
  c. Return  top 3 results

Helpful documentation  
 

https://www.mongodb.com/docs/v3.0/tutorial/project-fields-from-query-results/#return-the-specified-fields-and-the-id-field-only
https://www.mongodb.com/docs/manual/reference/operator/query/lte/#perform-an-update-based-on-embedded-document-fields

2. Write an aggregation aggregating `year` which calculates sum of all`runtime` for movies where `year` is between  1975 and 1980 including.
https://www.mongodb.com/docs/manual/aggregation/

Return results would look like  the 
year|sumRuntime

### Spark Databriks
1. Read into a dataframe the sample dataset `/databricks-datasets/adult/adult.data` 
2. Display top 5 rows ordered ASC by `age` and ASC by `education_num`.
Submit the 5 rows from the resutl in point 2 
https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/7274796508260238/2844662950865680/2879908466733289/latest.html

