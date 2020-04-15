#!/bin/bash
# Deploy
curl https://cronitor.link/WvZpY3/run -m 10 || true
git pull --rebase
./athena-start restart
curl https://cronitor.link/WvZpY3/complete -m 10 || true
# Update MOTD
hash=$(git rev-parse HEAD)
cat > npc/MOTD.txt <<EOF
-	script	HerculesMOTD	FAKE_NPC,{
	message strcharinfo(PC_NAME),"Welcome to tmRO! Running [${hash}]";
	end;
}
EOF
