#!/bin/bash
# Collects honeypot data from HoneyDb.io
# Excludes the Twitter feed and Nodes
# Last updated: 20200709 by @BradDFIR

##########ENTER YOUR API KEYS HERE########################################

# HoneyDb API ID:
APIID="API ID HERE"
# HoneyDB ThreatAPIKey:
APIKEY="THREAT API KEY HERE"

##########Functions##########

#Bad Hosts

Bad_Hosts() {
	echo "Pulling bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts \
	>> badhosts.json
}

#Filtered Bad Hosts

Filtered_Bad_Hosts(){
	echo "Pulling filtered bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts/mydata \
	>> filteredbadhosts.json
}

#Services

Services(){

	Service_array=(VNC SSH SIP Telnet FTP HTTP RDP SMTP Telnet.IoT Elasticsearch)
	
	for i in "${Service_array[@]}"; 
	do
		echo "Pulling $i bad hosts by service."
		curl --header "X-HoneyDb-ApiId: $APIID" \
		--header "X-HoneyDb-ApiKey:$APIKEY" \
		https://honeydb.io/api/bad-hosts/$i \
		>> badhosts$i.json
		
		sleep 5s;
	done
}

#Filtered Services

Filtered_Services(){

	Service_array=(VNC SSH SIP Telnet FTP HTTP RDP SMTP Telnet.IoT Elasticsearch)
	
	for i in "${Service_array[@]}"; 
	do
		echo "Pulling $i filtered bad hosts by service."
		curl --header "X-HoneyDb-ApiId: $APIID" \
		--header "X-HoneyDb-ApiKey:$APIKEY" \
		https://honeydb.io/api/bad-hosts/$i/mydata \
		>> filteredbadhosts$i.json

		sleep 5s;			
	done
}

#Filtered Sensor Data Count

Filtered_Sensor_Data_Count(){
	echo "Pulling filtered sensor data count"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/sensor-data/count/mydata?sensor-data-date=$DATE \
	>> filteredsensordatacount.json
}

#Sensor Data

Sensor_Data(){
	echo "Pulling filtered sensor data (first 1000 events)."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/sensor-data/mydata?sensor-data-date=$DATE \
    >> sensordata.json 
}

#Service Data

Service_Data(){
	echo "Pulling service data"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
    https://honeydb.io/api/services \
	>> services.json
}

##########################################################################

echo "1. Bad hosts
2. Filtered bad hosts
3. Bad hosts by service (pulls all services)
4. Filtered bad hosts by services (pulls all services)
5. Filtered sensor data count
6. Filtered sensor data
7: Services
8. Run all"
read -p "Selection: " CHOICE

#####Bad hosts#####

if (($CHOICE == 1));
then
	Bad_Hosts

#####Bad hosts by device#####

elif (($CHOICE == 2));
then
	Filtered_Bad_Hosts

#####Bad hosts by services#####

elif (($CHOICE == 3));
then
	Services

#####Bad hosts filtered by service by device#####

elif (($CHOICE== 4));
then
	Filtered_Services
	
#####Filtered sensor data count#####

elif (($CHOICE == 5));
then
	read -p "Please enter the date on which to count events in YYY-MM-DD format: " DATE
	Filtered_Sensor_Data_Count

#####Sensor data#####

elif (($CHOICE == 6));
then
	read -p "Please enter the date on which to count events in YYY-MM-DD format: " DATE
	Sensor_Data
 	
#####Services#####
 
elif (($CHOICE == 7));
then
	Service_Data

#####Pulls everything#####

else (($CHOICE == 8));
	read -p "Please enter the date wanted in YYYY-MM-DD format: " DATE

	Bad_Hosts
	
	sleep 5s

	Filtered_Bad_Hosts

	sleep 5s

	Services

	sleep 5s

	Filtered_Services

	sleep 5s

	Filtered_Sensor_Data_Count

	sleep 5s

	Sensor_Data

	sleep 5s

	Service_Data

fi
