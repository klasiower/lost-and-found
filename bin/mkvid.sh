#!/bin/sh

TYPE=garten
ROOT=/home/dst/timelapse
find ${ROOT}/${TYPE} -type f| sort -n | sed -ne 's/^\(.*\)$/file \1/p'  > ${ROOT}/data/${TYPE}.txt
ffmpeg -y -r 1/1 -f concat -safe 0 -i ${ROOT}/data/${TYPE}.txt -c:v libx264 -vf "fps=2,format=yuv420p" "${ROOT}/${TYPE}.mp4" > /dev/null 2>&1

TYPE=nest
ROOT=/home/dst/timelapse
find ${ROOT}/${TYPE} -type f| sort -n | sed -ne 's/^\(.*\)$/file \1/p'  > ${ROOT}/data/${TYPE}.txt
ffmpeg -y -r 1/1 -f concat -safe 0 -i ${ROOT}/data/${TYPE}.txt -c:v libx264 -vf "fps=2,format=yuv420p" "${ROOT}/${TYPE}.mp4" > /dev/null 2>&1
