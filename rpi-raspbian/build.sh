#!/bin/bash

docker build -t derbrummbaer/rpi-raspbian:jessie  ./jessie
docker build -t derbrummbaer/rpi-raspbian:stretch ./stretch
docker build -t derbrummbaer/rpi-raspbian:buster  ./buster