#!/bin/bash
# Collects honeypot data from HoneyDb.io
# Excludes the Twitter feed and Nodes
# Last updated: 20200629 by @BradD073

##########ENTER YOUR API KEYS HERE########################################

# HoneyDb API ID:
APIID="API ID HERE"
# HoneyDB ThreatAPIKey:
APIKEY="THREAT API KEY HERE"

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
	echo "Pulling bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts \
	>> badhosts.json

#####Bad hosts by device#####

elif (($CHOICE == 2));
then
	echo "Pulling filtered bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts/mydata \
	>> filteredbadhosts.json

#####Bad hosts by services#####

elif (($CHOICE == 3));
then
	SERVICE="VNC"

	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json

	sleep 5s
	
	SERVICE="SSH"

	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SIP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="FTP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="HTTP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="RDP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SMTP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet.IoT"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Elasticsearch"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json


#####Bad hosts filtered by service by device#####

elif (($CHOICE== 4));
then
	SERVICE="VNC"

	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json

	sleep 5s
	
	SERVICE="SSH"

	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SIP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="FTP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="HTTP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="RDP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SMTP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet.IoT"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Elasticsearch"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	

	
#####Filtered sensor data count#####

elif (($CHOICE == 5));
then
	read -p "Please enter the date on which to count events in YYY-MM-DD format: " DATE 
	echo "Pulling filtered sensor data count"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/sensor-data/count/mydata?sensor-data-date=$DATE \
	>> filteredsensordatacount.json


#####Sensor data#####

elif (($CHOICE == 6));
then
	read -p "Please enter the date on which to count events in YYY-MM-DD format: " DATE
	echo "Pulling filtered sensor data (first 1000 events)."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/sensor-data/mydata?sensor-data-date=$DATE \
    >> sensordata.json      


	
#####Services#####
 
elif (($CHOICE == 7));
then
	echo "Pulling service data"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
    https://honeydb.io/api/services \
	>> services.json


#####Pulls everything#####

else (($CHOICE == 8));
	read -p "Please enter the date wanted in YYYY-MM-DD format: " DATE

#####Bad hosts#####

	echo "Pulling bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts \
	>> badhosts.json

	sleep 5s

#####Bad hosts for device#####

	echo "Pulling filtered bad hosts."
	curl --header "X-HoneyDb-ApiId: $APIID" \
    --header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/bad-hosts/mydata \
	>> filteredbadhosts.json

	sleep 5s

#####Services pull#####

	SERVICE="VNC"

	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json

	sleep 5s
	
	SERVICE="SSH"

	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SIP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="FTP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="HTTP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="RDP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SMTP"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet.IoT"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Elasticsearch"
	
	echo "Pulling $SERVICE bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE \
	>> badhosts$SERVICE.json

	sleep 5s

#####Services pulled by device#####

	SERVICE="VNC"

	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json

	sleep 5s
	
	SERVICE="SSH"

	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SIP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="FTP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="HTTP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="RDP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="SMTP"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Telnet.IoT"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json
	
	sleep 5s
	
	SERVICE="Elasticsearch"
	
	echo "Pulling $SERVICE filtered bad hosts by service."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/bad-hosts/$SERVICE/mydata \
	>> filteredbadhosts$SERVICE.json

	sleep 5s

######Filtered sensor data count#####

	echo "Pulling filtered sensor data count"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey: $APIKEY" \
    https://honeydb.io/api/sensor-data/count/mydata?sensor-data-date=$DATE \
	>> filteredsensordatacount.json

	sleep 5s

######Sensor data#####

	echo "Pulling filtered sensor data (first 1000 events)."
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
	https://honeydb.io/api/sensor-data/mydata?sensor-data-date=$DATE \
    >> sensordata.json      

	sleep 5s

######Services#####

	echo "Pulling service data"
	curl --header "X-HoneyDb-ApiId: $APIID" \
	--header "X-HoneyDb-ApiKey:$APIKEY" \
    https://honeydb.io/api/services \
	>> services.json

fi
