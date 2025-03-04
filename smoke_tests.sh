#!/bin/bash

# Test Memcached
echo "Testing Memcached..."
memcached -h | grep "memcached"

# Test ImageMagick
echo "Testing ImageMagick..."
convert -version