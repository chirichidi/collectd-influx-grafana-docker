# README #

At the moment docker-compose not working, instead bring up containers as listed below:

### Bring up images individually ? ###

* Collectd
    docker build -t collectd .
    docker run -d collectd
* influxdb
    docker build -t influxdb .
    docker run -d -p 8083:8083 -p 8084:8084 -p 8086:8086 -p 25826:25826/udp -e ADMIN_USER="root" -e INFLUXDB_INIT_PWD="somepassword" -e PRE_CREATE_DB=collectd_db -e COLLECTD_DB="collectd_db" -e COLLECTD_BINDING=':25826' influxdb

* grafana
docker run -d --name=grafana -p 3000:3000 grafana/grafana

You will need to add data source manually to Grafana. Use collectdb with root/password (Don't use collectd_db - that is not where collectd data is going)