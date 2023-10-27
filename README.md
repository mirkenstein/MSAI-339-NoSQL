# NoSQL Databases and Data Pipelines with public data

### Initial setup Docker Environment
Setup your laptop prior to attending the in-class exercise. 
You will need docker and optionally download the container images as described in the 
[prerequisite steps](./prerequisite_steps.md)

### The NoSQL Databases with Docker
We will launch a local Elasticsearch cluster with dashboard component called Kibana
Detailed instructions for that can be found in the [ELK](./ELK/README.md) folder.

We will also briefly explore MongoDB and Couchbase databases via Docker.
### Data Pipelines
Data pipelines are posted in the [data-pipelines](./data-pipelines) folder
 
### The datasets
We will work with a small subset of the datasets listed [here](./datasets.md)

### MySQL Docker Compose
See the [MySQL](./MySQL/README.md) for a sample 
### Free cloud services
We will also introduce the MongoDB Atlas Free Tier Database Service 

https://account.mongodb.com/account/login
For detailed setup instructions see [README_ATLAS.md](Mongo%2FREADME_ATLAS.md)

And Streamsets Controlhub Data Pipeline
https://cloud.login.streamsets.com/login



For experimenting with Spark we can use Databricks cloud platform.

The offer a free with no-time limit clusters under their community edition offering.
The signup process is a little tricky. See the instructions in [./data-pipelines/Spark-Databricks/README.md](data-pipelines/Spark-Databricks/README.md)


https://www.databricks.com/product/faq/community-edition

During the signup process select the community option instead of the 14 day free trial.
https://community.cloud.databricks.com/