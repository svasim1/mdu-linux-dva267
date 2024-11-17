#!/bin/bash

cd ~
mkdir Logs
cp /var/log/*.log Logs/
tar -cf Logs/logs.tar Logs/*
rm Logs/*.log
ls Logs/
