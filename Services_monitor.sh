#!/bin/bash

services=("nginx" "ssh" "docker")

for service in "${services[@]}"; do
        if systemctl is-active --quiet "$service"; then
                echo "$service service is Running"
        else
                echo "$service is Stopped"
                sudo systemctl start "$service"
                if systemctl is-active --quiet "$service"; then
                        echo "$service restarting sucessfully"
                else
                        echo "failed to restart"


                fi
        fi

done
