# CMS Data Set
We will be loading various datasets from [CMS Research Statistics Data](https://www.cms.gov/Research-Statistics-Data-and-Systems/Research-Statistics-Data-and-Systems) 

The first dataset is from the 
[Medicare Physician & Other Practitioners - by Provider and Service]()

https://data.cms.gov/provider-summary-by-type-of-service/medicare-physician-other-practitioners/medicare-physician-other-practitioners-by-provider-and-service

##### To preview the data online and for collumn definitios go to this link
https://data.cms.gov/provider-summary-by-type-of-service/medicare-physician-other-practitioners/medicare-physician-other-practitioners-by-provider-and-service/data

##### Data Table Preview and Download
Click on the View Data option and you will be redirected to the following page: 

[https://data.cms.gov/Medicare-Physician-Supplier/Medicare-Provider-Utilization-and-Payment-Data-Phy/hczc-ufy5/data](https://data.cms.gov/Medicare-Physician-Supplier/Medicare-Provider-Utilization-and-Payment-Data-Phy/hczc-ufy5/data)



from there the data-set can be exported in CSV format by clicking on the top right "Export" shortcut and then selecting the CSV option.

This should download a file called `Medicare_Physician_Other_Practitioners_by_Provider_and_Service_2021.zip`


##### Alternative Data Download Method from the command line via

wget
```shell
wget  -O Medicare_Physician_Other_Practitioners_by_Provider_and_Service_2021.zip https://data.cms.gov/data-api/v1/dataset/5c67d835-3862-4f63-897d-85d3eac82d5b/data-viewer?_format=csv
````
or curl

```shell
curl  -o Medicare_Physician_Other_Practitioners_by_Provider_and_Service_2021.zip https://data.cms.gov/data-api/v1/dataset/5c67d835-3862-4f63-897d-85d3eac82d5b/data-viewer?_format=csv

```

Or with the `aria2`  utility
```shell
aria2c -s 16 -x 16  -O Medicare_Physician_Other_Practitioners_by_Provider_and_Service_2021.zip https://data.cms.gov/data-api/v1/dataset/5c67d835-3862-4f63-897d-85d3eac82d5b/data-viewer?_format=csv
```
    
#### Preview Sample data via the SODA API
 Click the "Access API" link  
To display the sample of 10 records visit this url 
[https://data.cms.gov/data-api/v1/dataset/92396110-2aed-4d63-a6a2-5d6207d46a29/data?size=10](https://data.cms.gov/data-api/v1/dataset/92396110-2aed-4d63-a6a2-5d6207d46a29/data?size=2)

or via curl
```shell
curl -X 'GET' \
  'https://data.cms.gov/data-api/v1/dataset/5c67d835-3862-4f63-897d-85d3eac82d5b/data?column=&offset=0&size=10' \
  -H 'accept: application/json'
```
```js
{
npi: "1003000126",
nppes_provider_last_org_name: "ENKESHAFI",
nppes_provider_first_name: "ARDALAN",
nppes_credentials: "M.D.",
nppes_provider_gender: "M",
nppes_entity_code: "I",
nppes_provider_street1: "900 SETON DR",
nppes_provider_city: "CUMBERLAND",
nppes_provider_zip: "21502",
nppes_provider_state: "MD",
nppes_provider_country: "US",
provider_type: "Internal Medicine",
medicare_participation: "Y",
place_of_service: "F",
hcpcs_code: "99218",
hcpcs_description: "Hospital observation care, typically 30 minutes",
hcpcs_drug_indicator: "N",
line_srvc_cnt: "19",
bene_unique_cnt: "19",
bene_day_srvc_cnt: "19",
average_medicare_allowed: "100.88315789",
average_submitted_chrg_amt: "476.94736842",
average_medicare_payment: "76.795263158",
average_medicare_standard: "77.469473684",
:id: "row-c9fw.7h7k~jfg5",
:created_at: "2020-11-19T15:47:53.518Z",
:updated_at: "2020-11-19T15:47:53.518Z"
}


```
We will use the column name definitions from the JSON file

# Elasticsearch-Kibana Provisioning

###Provision Elasticsearch and Kibana with docker as 
Follow the instructions in [ELK](./ELK/README.md)
 
 
To verify that the cluster is up and running you can visit the following endpoints in your web browser

[https://localhost:9200/](https://localhost:9200/)

expected output
```js
{
    "name": "es01",
    "cluster_name": "es-cluster",
    "cluster_uuid": "rrdiBxTHSLeUcqloEo8RsA",
    "version": {
        "number": "8.10.4",
        "build_flavor": "default",
        "build_type": "docker",
        "build_hash": "b4a62ac808e886ff032700c391f45f1408b2538c",
        "build_date": "2023-10-11T22:04:35.506990650Z",
        "build_snapshot": false,
        "lucene_version": "9.7.0",
        "minimum_wire_compatibility_version": "7.17.0",
        "minimum_index_compatibility_version": "7.0.0"
    },
    "tagline": "You Know, for Search"
}
```
Also try the `_cat/nodoes` endpoint
[http://localhost:9200/_cat/nodes?v](http://localhost:9200/_cat/nodes?v)

expected output depending on the number of elasticsearch nodes 
```shell
ip         heap.percent ram.percent cpu load_1m load_5m load_15m node.role   master name
172.18.0.3           32          80   2    0.05    0.06     0.09 cdfhilmrstw -      es03
172.18.0.4           58          80   1    0.05    0.06     0.09 cdfhilmrstw *      es02
172.18.0.5           65          80   1    0.05    0.06     0.09 cdfhilmrstw -      es01
```
 

### Logstash Pipeline
1. Download Logstash container 
 ```shell
 docker pull docker.elastic.co/logstash/logstash:8.10.4
```
 
2. Move the downloaded CSV data file to a separate directory



 
3. Run the pipeline
We will attach two volumes to the pipeline. One for the configuraion file and another one with the data
https://www.elastic.co/guide/en/logstash/current/docker-config.html

```shell
 docker run   --rm -it \
 --net=elastic \
 -v <full path to pipeline folder>:/usr/share/logstash/pipeline/ \
 -v <full path to data folder>:/opt/data  \
 -e ES_USER=$ES_USER \
 -e ES_PASS=$ES_PASS \
 docker.elastic.co/logstash/logstash:8.10.4 

```
4. Open Kibana in your browser 

Open the URL
[http://localhost:5601/](http://localhost:5601/)

Create Index pattern

Left vertical Menu->Stack Management->Data Views
[http://localhost:5601/app/management/kibana/dataViews](http://localhost:5601/app/management/kibana/dataViews)


Click on the `Create Data View` button on the top right.

Step 1 of 2: Define index pattern type `cms-puf-*` then Next button.
The index pattern is a substring matching the  `index` settings defined in the pipeline config 
```shell
   elasticsearch {
      "index" => "cms-puf-2021"
      ...
```
Later if we add data from another year we will poinmt to the other indices with the same data view.
Step 2 of 2: Configure settings: Select @timestamp field 

Then click on `Create data view` to complete the process


To explore the data go to Discover 
[http://localhost:5601/app/kibana#/discover](http://localhost:5601/app/kibana#/discover)
 