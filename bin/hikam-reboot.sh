#!/bin/sh

# this shell script reboots a hikam S6

USER="admin"
PASS="Hier wäre Platz für Ihre Werbung"
HOST="192.168.2.12"

## Step 1: LOGIN

## REQUEST
# POST /goform/formHiKamLogin HTTP/1.1
# Host: ${HOST}
# User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0
# Accept: application/json, text/javascript, */*; q=0.01
# Accept-Language: en-US,en;q=0.5
# Accept-Encoding: gzip, deflate
# Content-Type: application/x-www-form-urlencoded; charset=UTF-8
# X-Requested-With: XMLHttpRequest
# Content-Length: 47
# Origin: http://${HOST}
# Connection: keep-alive
# Referer: http://${HOST}/index.html
# Cookie: dev_password=${PASS}

## RESPONSE
# username=${USER}&password=${PASS}&loginBtn=LoginHTTP/1.0 200 OK
# Pragma: no-cache
# Cache-control: no-cache
# Content-Type: text/html
# Server: luozewen-Webs
# Set-Cookie: dev_password=${PASS}; Path=/; 
# 
# {"return_code":0}

wget \
	 --header="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0"   \
	 --header="Accept: application/json, text/javascript, */*; q=0.01"   \
	 --header="Accept-Language: en-US,en;q=0.5"   \
	 --header="Accept-Encoding: gzip, deflate"   \
	 --header="Content-Type: application/x-www-form-urlencoded; charset=UTF-8"   \
	 --header="X-Requested-With: XMLHttpRequest"   \
	 --header="Content-Length: 47"   \
	 --header="Origin: http://${HOST}"   \
	 --header="Connection: keep-alive"   \
	 --header="Referer: http://${HOST}/index.html"   \
	 --header="Cookie: dev_password=${PASS}"   \
	 --post-data="username=${USER}&password=${PASS}&loginBtn=Login" \
     "http://${HOST}/goform/formHiKamLogin" -S -O -

## Step 2: REBOOT

## REQUEST
# GET /goform/formHiKamReboot? HTTP/1.1
# Host: ${HOST}
# User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0
# Accept: application/json, text/javascript, */*; q=0.01
# Accept-Language: en-US,en;q=0.5
# Accept-Encoding: gzip, deflate
# X-Requested-With: XMLHttpRequest
# Connection: keep-alive
# Referer: http://${HOST}/system.html
# Cookie: dev_password=${PASS}

## RESPONSE
# HTTP/1.0 200 OK
# Pragma: no-cache
# Cache-control: no-cache
# Content-Type: text/html
# Server: luozewen-Webs

# {"return_code":0}

wget \
	 --header="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0"   \
	 --header="Accept: application/json, text/javascript, */*; q=0.01"   \
	 --header="Accept-Language: en-US,en;q=0.5"   \
	 --header="Accept-Encoding: gzip, deflate"   \
	 --header="X-Requested-With: XMLHttpRequest"   \
	 --header="Connection: keep-alive"   \
	 --header="Referer: http://${HOST}/system.html"   \
	 --header="Cookie: dev_password=${PASS}"   \
	 "http://${HOST}/goform/formHiKamReboot?" -S -O -
