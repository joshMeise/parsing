#!/bin/bash
rm -f ./pass.* ./fail.* 

# [PASSING TESTS]
echo -en "GET /where?q=now HTTP/1.1\nMessage\n" > ./pass.1
echo -en "PUT * HTTP/1.0\n" > ./pass.2
echo -en "TRACE http://www.example.org/pub/WWW/TheProject.html HTTP/1.2\n" > ./pass.3
echo -en "CONNECT www.example.com:80 HTTP/1.1\n" > ./pass.4
echo -en "POST / HTTP/1.1\n" > ./pass.5
echo -en "GET /background.png HTTP/1.0\n" > ./pass.6
echo -en "HEAD /test.html?query=alibaba HTTP/1.2\n" > ./pass.7
echo -en "OPTIONS /anypage.html HTTP/1.0\n" > ./pass.8
echo -en "GET https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages HTTP/1.1\nError\n" > ./pass.9
echo -en "CONNECT developer.mozilla.org:80 HTTP/1.1\nThis is a message" > ./pass.10
echo -en "HTTP/1.1 404 Not Found\nfekj$%aenoEfjoc" > ./pass.11
echo -en "HTTP/1.1 100 Continue\n" > ./pass.12
echo -en "HTTP/1.1 201 Created\n" > ./pass.13
echo -en "HTTP/1.1 302 Found\n" > ./pass.14
echo -en "HTTP/1.1 503 Service Unavailable\n" > ./pass.15

# [FAILING TESTS]
echo -en "HTTP/11.1\n" > ./fail.1
echo -en "HTTP/1.11\n" > ./fail.2
echo -en "HTTP/11\n" > ./fail.3
echo -en "HTTP/.1\n" > ./fail.4
echo -en "PUT - HTTP/1.0\n" > ./fail.5
echo -en "GET fojan HTTP/1.1\n" > ./fail.6
echo -en "HTTP/1.1 704 Not Found\n" > ./fail.7
echo -en "GST /where?q=now HTTP/1.1\n" > ./fail.8
echo -en "OPTIONS /anypage.html HTTP/19.0\n" > ./fail.9
echo -en "OPTIONS words HTTP/1.0\n" > ./fail.10
echo -en "HTTP/1.1 52 Bad\n" > ./fail.11
echo -en "HTTP/1.1 1 Good\n" > ./fail.12
echo -en "HTTP/1.1 2345 Bad\n" > ./fail.13

# generate a file with the number of pass and fail tests
#NUMPASS=(pass.*)
#NUMFAIL=(fail.*)
#echo "${#NUMPASS[@]} ${#NUMFAIL[@]}" > ./numtests
