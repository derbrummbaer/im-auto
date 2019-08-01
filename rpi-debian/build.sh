#!/bin/bash

docker build -t derbrummbaer/rpi-debian:jessie  ./jessie
docker build -t derbrummbaer/rpi-debian:stretch ./stretch
docker build -t derbrummbaer/rpi-debian:buster  ./buster