#!/bin/bash

envsubst < /autoreply.py.tpl > /autoreply.py

python /autoreply.py > /dev/stdout
