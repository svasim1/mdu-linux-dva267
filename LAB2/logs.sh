#!/bin/bash

cd $HOME
mkdir -p Logs
cp /var/log/*.log Logs/
tar -czf Logs/logs.tar.gz -C Logs .
rm Logs/*.log
ls Logs/
