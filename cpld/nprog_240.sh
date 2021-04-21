#!/bin/sh
cd "$(dirname $0)"
sudo openocd -f ./nprog/68_240.cfg
