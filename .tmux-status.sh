#!/usr/bin/env bash

batteries=$(upower -e | grep 'BAT')

status="#[bg=colour238,bold] "

for battery in ${batteries}; do
	if [ $(upower -i ${battery} | grep -E "state" | tr -s " " | cut -d " " -f 3) == "charging" ]; then
		status+="#[fg=colour76]"
	else
		status+="#[fg=colour196]"
	fi
	status+=$(upower -i ${battery} | grep -E "percentage" | tr -s " " | cut -d " " -f 3)
	status+="  "
done

echo ${status: : -2}

