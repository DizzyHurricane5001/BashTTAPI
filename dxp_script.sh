#!/bin/bash
# @Tom B
# Made for use with bootstrap tables
filename='tt_server_addresses.txt'
cp index_template.html index.html
while read addr; do 
    echo \<tr\> \<td\> "$addr" \<\/td\>\<td\> >> index.html
    wget -q -t 1 --timeout=5 --header="X-Tycoon-Key:X-Tycoon-Key" $addr -O -| jq -r '.server.dxp' | sed 's|[],[/n]||g' >> index.html # OR grep -Po '"dxp":.*?[^\\]"' >> index.html (modify sed)
    echo \<\/td\>\<\/tr\> >> index.html
done < $filename

# tt_server_addresses.txt example:
#http://server.tycoon.community:30122/status/widget/players.json
#http://server.tycoon.community:30123/status/widget/players.json
#http://server.tycoon.community:30124/status/widget/players.json
#http://server.tycoon.community:30125/status/widget/players.json
#http://na.tycoon.community:30120/status/widget/players.json
#http://na.tycoon.community:30122/status/widget/players.json
#http://na.tycoon.community:30123/status/widget/players.json
#http://na.tycoon.community:30124/status/widget/players.json
#http://na.tycoon.community:30125/status/widget/players.json
#https://tycoon-dgpvx3.users.cfx.re/sessionmanager/players.json

# OUTPUT example included in README
