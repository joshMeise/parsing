#!/bin/bash
rm -f ./pass.* ./fail.* 

# [PASSING TESTS]
echo -en "GET /where?q=now HTTP/1.1\n\nMessage\n" > ./pass.1
echo -en "PUT * HTTP/1.0\n\n" > ./pass.2
echo -en "TRACE http://www.example.org/pub/WWW/TheProject.html HTTP/1.2\nHost: localhost:8000\n\nMessage\n" > ./pass.3
echo -en "CONNECT www.example.com:80 HTTP/1.1\nHost:loalhost:8000\nHost: localhost:8000\n\n" > ./pass.4
echo -en "GET / HTTP/1.1\nHost: developer.mozilla.org\nAccept-Language: fr\n\n" > ./pass.5
echo -en "GET /background.png HTTP/1.0\nImage: requested\n\nMessage" > ./pass.6
echo -en "POST /contact_form.php HTTP/1.1\nHost: developer.mozilla.org\nContent-Length: 64\nContent-Type: application/x-www-form-urlencoded\n\nname=Joe%20User&request=Send%20me%20one%20of%20your%20catalogue" > ./pass.7
echo -en "OPTIONS /anypage.html HTTP/1.0\nHost: localhost\nAuthority: me\n\n" > ./pass.8
echo -en "GET https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages HTTP/1.1\nLocal-host: localhost:8000\n\nError with newline\n" > ./pass.9
echo -en "CONNECT developer.mozilla.org:80 HTTP/1.1\nRobust: tests\n\nMulti-worded message with a special character ^ and no newline following it" > ./pass.10
echo -en "HTTP/1.1 200 OK\nContent-Type: text/html; charset=utf-8\nConnection: keep-alive\n\n<!DOCTYPE html>\n<html lang="en">" > ./pass.11
echo -en "HTTP/1.1 100 Continue\n\n" > ./pass.12
echo -en "HTTP/1.1 201 Created\n\nHost: server side\n\nMessage\n" > ./pass.13
echo -en "HTTP/1.1 303 Moved permanently\nServer: Apache/2.4.37 (Red Hat)\nontent-Type: text/html; charset=utf-8\nDate: Thu, 06 Dec 2018 17:33:08 GMT\n\nThis is a message\n" > ./pass.14
echo -en "HTTP/1.1 503 Service Unavailable\n\n<!DOCTYPE html>… (contains a site-customized page helping the user to find the missing resource)" > ./pass.15
echo -en "HTTP/1.1 503 Service Unavailable\n\n<!DOCTYPE html>… (contains a site-customized page helping the user to find the missing resource)\n There is a line fold here" > ./pass.16
echo -en "CONNECT www.example.com:80 HTTP/1.1\nNo-field-value:\n\n" > ./pass.17

# [FAILING TESTS]
echo -en "GET /where?q=now HTTP/1.1\nMessage\n" > ./fail.1
echo -en "PUT * HTTP/1.0\nHost:host\nMessage\n" > ./fail.2
echo -en "TRANE http://www.example.org/pub/WWW/TheProject.html HTTP/1.2\nHost: localhost:8000\n\nMessage\n" > ./fail.3
echo -en "CONNECT www.example.com:80 HTTP/1.11\nHost:loalhost 43\n\n" > ./fail.4
echo -en "GET / HTTP/1.1\nHost: developer.mozilla.org\nAccept-Language fr\n\n" > ./fail.5
echo -en "GET ~ HTTP/1.1\nHost: developer.mozilla.org\nAccept-Language: fr\n\n" > ./fail.6
echo -en "POST /contact_form.php HTT/1.1\nHost: developer.mozilla.org\nContent-Length: 64\nContent-Type: application/x-www-form-urlencoded\n\nname=Joe%20User&request=Send%20me%20one%20of%20your%20catalogue" > ./fail.7
echo -en "OPTIONS /anypage.html HTTP/1.0\nHost: localhost\nAuthority: me my\n" > ./fail.8
echo -en "https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages HTTP/1.1\nReduce: hostName\n\nError\n" > ./fail.9
echo -en "CONNECT developer.mozilla.org:80\nRobust: tests\n\nThis is a message" > ./fail.10
echo -en "CONNECT  HTTP/1.1\nRobust: tests\n\nThis is a message" > ./fail.11
echo -en "HTTP/12.1 200 OK\nContent-Type: text/html; charset=utf-8\nConnection: keep-alive\n\n<!DOCTYPE html>\n<html lang="en">" > ./fail.12
echo -en "HTTP/1.1 600 Continue\n\n" > ./fail.13
echo -en "HTTP/1.1 500 Continue\n" > ./fail.14
echo -en "HTTP/1.1 5004 Service Unavailable\n\n<!DOCTYPE html>… (contains a site-customized page helping the user to find the missing resource)" > ./fail.15
echo -en "HTTP/1.1 100 \n\n" > ./fail.16
echo -en "HTTP/1.1 Continue\n\n" > ./fail.17
echo -en "HTTP/1.1  Continue\n\n" > ./fail.18
echo -en "GET /where?q=now \nMessage\n" > ./fail.19
echo -en " /where?q=now HTTP/1.1\nMessage\n" > ./fail.20
echo -en "GET HTTP/1.1\nMessage\n" > ./fail.21
echo -en "HTTP/1.1 503 Service Unavailable\n\n<!DOCTYPE html>… (contains a site-customized page helping the user to find the missing resource)\nThere is a line fold here with no required whitespace" > ./fail.22
echo -en "CONNECT www.example.com:80 HTTP/1.11\nHost space:loalhost 43\n\n" > ./fail.23

# generate a file with the number of pass and fail tests
#NUMPASS=(pass.*)
#NUMFAIL=(fail.*)
#echo "${#NUMPASS[@]} ${#NUMFAIL[@]}" > ./numtests
