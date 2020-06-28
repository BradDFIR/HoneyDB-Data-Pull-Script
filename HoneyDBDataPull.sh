#!/bin/bash
# Collects honeypot data from HoneyDb.io
# Excludes the Twitter feed and Nodes
# Last updated: 20200628 by @BradD073


# HoneyDb API ID:
APIID="API ID HERE"
# HoneyDB ThreatAPIKey:
APIKEY="THREAT API KEY HERE"

echo "1. Bad hosts
2. Filtered Bad hosts
3. Bad Hosts By Service
4. Filtered Bad Hosts By Services
5. Filtered Sensor Data Count
6. Filtered Sensor Data
7: Services
8. Run all"
read -p "Selection: " CHOICE


if (($CHOICE == 1));
then
	echo "Pulling bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts \
	>> badhosts.json

elif (($CHOICE == 2));
then
	echo "Pulling filtered bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts/mydata \
	>> filteredbadhosts.json

elif (($CHOICE == 3));
then
	read -p "Please enter the name of the service: " SERVICE
	SERVICE=${SERVICE^^}
	echo "Pulling bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json

elif (($CHOICE== 4));
then
	read -p "Please enter the name of the service: " SERVICE
	SERVICE=${SERVICE^^}
	echo "Pulling filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json

elif (($CHOICE == 5));
then
	read -p "Please enter the date on which to count events in YYY-MM-DD format: " DATE 
	echo "Pulling filtered sensor data count"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/sensor-data/count/mydata?sensor-data-date=$DATE \
	>> filteredsensordatacount.json

elif (($CHOICE == 6));
then
	read -p "Please enter the date on which to count events in YYY-MM-DD format: " DATE
	echo "Pulling filtered sensor data (first 1000 events)."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/sensor-data/mydata?sensor-data-date=$DATE \
    >> sensordata.json      
	
elif (($CHOICE == 7));
then
	echo "Pulling service data"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
    https://honeydb.io/api/services \
	>> services.json

else (($CHOICE == 8));
	read -p "Please enter the date wanted in YYYY-MM-DD format: " DATE

	echo "Pulling bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts \
	>> badhosts.json

	echo "Pulling filtered bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts/mydata \
	>> filteredbadhosts.json

	read -p "Please enter the name of the service: " SERVICE
	SERVICE=${SERVICE^^}
	echo "Pulling bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json

	read -p "Please enter the name of the service: " SERVICE
	SERVICE=${SERVICE^^} 
	echo "Pulling filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json

	echo "Pulling filtered sensor data count"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/sensor-data/count/mydata?sensor-data-date=$DATE \
	>> filteredsensordatacount.json

	echo "Pulling filtered sensor data (first 1000 events)."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/sensor-data/mydata?sensor-data-date=$DATE \
    >> sensordata.json      

	echo "Pulling service data"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
    https://honeydb.io/api/services \
	>> services.json

fi


