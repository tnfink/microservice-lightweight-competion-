# README #

### Description ###
* A very simple demo of a basic calculator implemented in Swift as a web resource that is running on Kitura HTTP Server.

### Docker ###
A Dockerfile is included. 

#### Build ####
```
docker build --tag akquinet/mlc-swift:1.0 .
```

#### Run ####
```
# First start
docker run -p 8080:8080 --name mlc-swift-microservice -t akquinet/mlc-swift:1.0
# Later starts
docker start akquinet/mlc-swift:1.0
```

### Usage ###
```
curl http://localhost:8080/add/4/and/6
The sum of 4 and 6 equals 10.
```
