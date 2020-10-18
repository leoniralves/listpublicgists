#!/bin/zsh

APIB=./MockAPI/api_blueprint.apib
PORT=4000

drakov -f $APIB -p $PORT --debugMode --watch --public #--delay 2000