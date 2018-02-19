#!/usr/bin/env bash

BG1="colour232"
BG2="colour236"
BG3="colour240"

BAD_FG="colour196"
NEUTRAL_FG="colour231"
GOOD_FG="colour76"


batteries=$(upower -e | grep 'BAT')

battery_status=" "

for battery in ${batteries}; do
	if [ $(upower -i ${battery} | grep -E "state" | tr -s " " | cut -d " " -f 3) == "charging" ]; then
		battery_status+="#[fg=${GOOD_FG}]"
	else
		battery_status+="#[fg=${BAD_FG}]"
	fi
	battery_status+=$(upower -i ${battery} | grep -E "percentage" | tr -s " " | cut -d " " -f 3)
	battery_status+=" "
done

total_cpus=$(nproc --all)
cpu_info=$(cat /proc/loadavg | cut -d" " -f1-3)
cpu_5m=$(cut -d " " -f 2 <<< ${cpu_info})
cpu_5m=${cpu_5m%.*}

if [[ ${cpu_5m} -ge ${total_cpus} ]]; then
	CPU_COLOR=${BAD_FG}
elif [ ${cpu_5m} -ge $(expr ${total_cpus} / 2) ]; then
	CPU_COLOR=${NEUTRAL_FG}
else
	CPU_COLOR=${GOOD_FG}
fi

cpu_status="#[fg=${CPU_COLOR}] ${cpu_info} "

date_status="#[fg=${NEUTRAL_FG}] $(date +%k:%M)"

status="#[fg=${BG3}]#[bg=${BG3}]${cpu_status}"
status+="#[fg=${BG2}]#[bg=${BG2}]${battery_status}"
status+="#[fg=${BG1}]#[bg=${BG1}]${date_status}"

echo ${status}
