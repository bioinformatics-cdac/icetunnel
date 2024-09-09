# ICETUNNEL - Tunnels and Reverse Tunnels over WebSocket for Node.js

## Overview

A set of Node.js tools to establish TCP tunnels (or TCP reverse tunnels) over WebSocket connections for circumventing the problem of directly connect to hosts behind a strict firewall or without public IP. It also supports WebSocket Secure (wss) connections.

## Installation
```
npm install @bioinformatics-cdac/icetunnel
```

## Usage (from command line)
A command line tool (icetunnel) is also available in the bin directory.

Examples about how to run a tunnel server:
```
//without security
./icetunnel -s 8080

//with security
./icetunnel -s 8080 --ssl=true --key="<PRIVATE-KEY-PATH>" --cert="<PUBLIC-KEY-PATH>"
```
Examples about how to run a tunnel client:
```
//without security
./icetunnel -t 33:2.2.2.2:33 ws://iceserverIP:443 

//with security
./icetunnel -t 33:2.2.2.2:33 wss://iceserverIP:8080
```
In both examples, connections to localhost:33 on the client will be tunneled to 2.2.2.2:33 through the Websocket connection with the server. Note that the decision about the final destination of the tunnel is up to the client. Alternatively, it is possible to lock the final destination of the tunnel on the server side. 

Examples about how to run a tunnel server locking the final tunnel destination: 
```
//without security 
./icetunnel -s 8080 -t 2.2.2.2:33

//with security
./icetunnel -s 8080 -t 2.2.2.2:33 --ssl=true --key="<PRIVATE-KEY-PATH>" --cert="<PUBLIC-KEY-PATH>"
```
Examples about how to run a tunnel client when the final tunnel destination has been locked by the server:
```
//without security
./icetunnel -t 33 ws://iceserverIP:443 

//with security
./icetunnel -t 33 wss://iceserverIP:443
```

Examples about how to run a reverse tunnel server:
```
//without security
./icetunnel -r -s 8080

//with security
./icetunnel -r -s 8080 --ssl=true --key="<PRIVATE-KEY-PATH>" --cert="<PUBLIC-KEY-PATH>"
```
Examples about how to run a reverse tunnel client:
```
//without security
./icetunnel -r6666:2.2.2.2:33 ws://server:8080

//with security 
./icetunnel -r6666:2.2.2.2:33 wss://server:8080
```
In the above examples, the client asks the server to open a TCP server on port 6666 and all connections on this port are tunneled to the client that is directely connected to 2.2.2.2:33.


## Logging system
ICETUNNEL uses Log4js library to manage its logs in /var/log/ice/
