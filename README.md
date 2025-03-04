# Memchached

## Build the Docker image
docker build -t my-memcache-app .

## Run the Docker container
docker run -d --name my-memcache-app -p 11211:11211 -p 80:80 my-memcache-app

## Test it
### Install telnet
brew install telnet

### Connect
telnet localhost 11211

### Set and get a value
set mykey 0 900 4
data
STORED
get mykey
VALUE mykey 0 4
data
END

