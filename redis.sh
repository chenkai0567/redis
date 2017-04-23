#!/bin/bash
# redis repo https://github.com/antirez/redis
echo "clean up the build"
for i in hiredis linenoise lua geohash-int; do
    pushd deps/$i
    make clean
    popd
done
make clean

echo "build redis dependencies"
cd deps
CC=gcc make hiredis linenoise lua geohash-int

echo "build redis"
cd ..
CC=gcc make USE_JEMALLOC=no


echo "test redis"
make check
