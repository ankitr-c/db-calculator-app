#!/bin/bash

sudo apt-get update
sudo apt-get install -y python3-pip || echo "failed to install pip"
pip3 install -r requirements.txt || echo "failed to install requirements"
nohup python3 main.py > output.log 2>&1 &
