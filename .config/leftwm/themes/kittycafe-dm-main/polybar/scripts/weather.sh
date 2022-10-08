#!/bin/bash

content=$(curl -s 'https://wttr.in/?format=j1' | jq .current_condition[0])
ICON=$(curl -s 'https://wttr.in/?format=1' | sed 's/[+0-9a-cA-Z°-]//g' )
TEMP=$(echo $content | jq -r .temp_F)
SKY=$(echo $content | jq .weatherDesc[0] | jq -r .value)
LOCATION=$(curl -s 'wttr.in/?format=j1' | jq .nearest_area[0] | jq .areaName[0] | jq -r .value)
# echo '{"text": "'$TEMP°F $ICON'", "tooltip": "'$TEMP°F $ICON $SKY $LOCATION'"}'
echo $TEMP°F $SKY $LOCATION
