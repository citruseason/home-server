#!/bin/bash

DIR_HERE=$(pwd)

# Cloud Password 설정
if [ -z "$CLOUD_DB_PASSWORD" ]; then
    while true; do
        echo -n "Enter database password: "
        stty -echo
        read cloud_password
        echo -e -n "\nEnter repeat password: "
        stty -echo
        read cloud_password_repeat
        stty echo
        echo ""

        if [ "$cloud_password" == "$cloud_password_repeat" ]; then
            echo "export CLOUD_DB_PASSWORD=\"${cloud_password}\"" >> ~/.bashrc
            source ~/.bashrc
            break
        else
            echo "Two password does not match."
        fi
    done
fi

# Plex Claim 설정
if [ -z "$PLEX_CLAIM" ]; then
    while true; do
        echo -n "Enter Plex Claim Token: "
        read token
        echo ""

        if [ "$token" != "" ]; then
            echo "export PLEX_CLAIM=\"${token}\"" >> ~/.bashrc
            source ~/.bashrc
            break
        else
            echo "Please get token and input token (https://www.plex.tv/claim/)"
        fi
    done
fi

docker-compose -f nginx/docker-compose.yml up -d --build
docker-compose -f nas/docker-compose.yml up -d --build
docker-compose -f netdata/docker-compose.yml up -d --build