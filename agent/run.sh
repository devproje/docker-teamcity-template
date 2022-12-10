#!/bin/bash
if [ ! -f "ran.txt" ]; then
    sed -i "s@{url}@$SERVER_URL@" ./conf/buildAgent.properties
    echo "B" > ran.txt
fi

bash ./bin/agent.sh run