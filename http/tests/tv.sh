#!/bin/bash
rm -f ./pass.* ./fail.* 

# [PASSING TESTS]
echo -n "GET /where?q=now HTTP/1.1" > ./pass.1
echo -n "PUT * HTTP/1.0" > ./pass.2
echo -n "TRACE http://www.example.org/pub/WWW/TheProject.html HTTP/1.2" > ./pass.3
echo -n "CONNECT www.example.com:80 HTTP/1.1" > ./pass.4
echo -n "POST / HTTP/1.1" > ./pass.5
echo -n "GET /background.png HTTP/1.0" > ./pass.6
echo -n "HEAD /test.html?query=alibaba HTTP/1.2" > ./pass.7
echo -n "OPTIONS /anypage.html HTTP/1.0" > ./pass.8
echo -n "GET https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages HTTP/1.1" > ./pass.9
echo -n "CONNECT developer.mozilla.org:80 HTTP/1.1" > ./pass.10
echo -n "HTTP/1.1 404 Not Found" > ./pass.11
echo -n "HTTP/1.1 100 Continue" > ./pass.12
echo -n "HTTP/1.1 201 Created" > ./pass.13
echo -n "HTTP/1.1 302 Found" > ./pass.14
echo -n "HTTP/1.1 503 Service Unavailable" > ./pass.15

# [FAILING TESTS]
echo -n "HTTP/11.1" > ./fail.1
echo -n "HTTP/1.11" > ./fail.2
echo -n "HTTP/11" > ./fail.3
echo -n "HTTP/.1" > ./fail.4
echo -n "PUT - HTTP/1.0" > ./fail.5
echo -n "GET fojan HTTP/1.1" > ./fail.6
echo -n "HTTP/1.1 704 Not Found" > ./fail.7
echo -n "GST /where?q=now HTTP/1.1" > ./fail.8
echo -n "OPTIONS /anypage.html HTTP/19.0" > ./fail.9
echo -n "OPTIONS words HTTP/1.0" > ./fail.10
echo -n "HTTP/1.1 52 Bad" > ./fail.11
echo -n "HTTP/1.1 1 Good" > ./fail.12
echo -n "HTTP/1.1 2345 Bad" > ./fail.13

# generate a file with the number of pass and fail tests
#NUMPASS=(pass.*)
#NUMFAIL=(fail.*)
#echo "${#NUMPASS[@]} ${#NUMFAIL[@]}" > ./numtests
