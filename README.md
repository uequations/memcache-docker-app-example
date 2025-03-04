# Memcached

## Build the Docker image
docker build -t my-memcache-app .

## Run the Docker container
docker run -d --name my-memcache-app -p 11211:11211 -p 80:80 my-memcache-app

## Test it
### Install telnet (on Mac)
```sh
brew install telnet
```

### Connect
```sh
telnet localhost 11211
```

### Set and get a value
```sh
set mykey 0 900 4
data
STORED
get mykey
VALUE mykey 0 4
data
END
```

