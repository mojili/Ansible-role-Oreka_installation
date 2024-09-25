#!/bin/bash

exec curl --user admin:admin 'http://127.0.0.1:3000/api/datasources' -X  POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"Local Prometheus","isDefault":true,"type":"prometheus","url":"http://localhost:9090","access":"proxy","basicAuth":false}'

