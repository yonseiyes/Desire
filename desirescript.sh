# Desire
#!/bin/bash

SWAPFILE="/var/swap.img"

cd ..
if free | awk '/^Swap:/ {exit !$2}'; then
  echo "Have swap"
else
  echo "No swap file found, creating and adding to /etc/fstab"
  sudo touch "$SWAPFILE"
  sudo chmod 600 "$SWAPFILE"
  sudo dd if=/dev/zero of="$SWAPFILE" bs=1024k count=2000
  sudo mkswap "$SWAPFILE"
  sudo swapon "$SWAPFILE"
  sudo echo "$SWAPFILE none swap sw 0 0" >> /etc/fstab
  echo "Created Swapfile at $SWAPFILE"
fi
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install nano htop git curl -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

git clone https://github.com/lazyboozer/Desire.git
cd ./Desire
chmod -R 755 autogen.sh
./autogen.sh
./configure
chmod 755 share/genbuild.sh
make
cd src
./desired -daemon
sleep 10

echo " Enter rpcuser"
read -p " > rpcuser : " rpcuser
echo
echo " Enter rpcpassword"
read -p " > rpcpassword : " rpcpassword
echo

externalip=$(curl -s "http://getip.dk" | sed -ne "s/^IP: //p")
masternodekey=$(./desire-cli masternode genkey)
./desire-cli stop
echo -e "rpcuser=$rpcuser\nrpcpassword=$rpcpassword\nrpcallowip=127.0.0.1\nlisten=1\nserver=1\ndaemon=1\nrpcport=9918\nstaking=0\nexternalip=$externalip:9919\nmaxconnections=256\nmasternode=1\nmasternodeprivkey=$masternodekey" >> $HOME/.desirecore/desire.conf
echo "Masternode private key: $masternodekey"
./desired -daemon

#sleep 10
#blockcount1=$(./desire-cli getblockcount)
#echo blockcount1=$blockcount1
#sleep 10
#blockcount2=$(./desire-cli getblockcount)
#echo blockcount2=$blockcount2

echo Sentinel Set-up is starting.....
cd ~/.desirecore;
wget https://github.com/ZonnCash/sentinel/releases/download/v1.1.0-win64/sentinel-lin64 ;
chmod +x sentinel-lin64 ;
nohup ./sentinel-lin64 & 
echo "Job completed successfully"
echo "Masternode private key: $masternodekey"
