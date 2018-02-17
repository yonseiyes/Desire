
# DesireCoin
Shell script to install a [Desire Masternode] on a Linux server running Ubuntu 16.04. Use it on your own risk.  

***
## Installation:  
Copy & Paste below in Command line of VPS server & Press 'Enter'

sudo apt install git ;
sudo git clone https://github.com/yonseiyes/desirescript.git ;
cd desirescript ;
sudo chmod +x desirescript.sh ;
sudo ./desirescript.sh ;


## Desktop wallet setup  

After the MN is up and running, you need to configure the desktop wallet accordingly. Here are the steps:  
1. Open the DesireCoin Desktop Wallet.  
2. Go to RECEIVE and create a New Address: **MN01**  
3. Send **1000** DSR to **MN01**.  
4. Wait for 15 confirmations.  
5. Go to **Tools -> "Debug Console"**  
6. Type the following command: **masternode outputs**  
7. Open **Masternodes.conf** file  
8. fill the next items
* Alias: **MN01** 
* Address: **VPS_IP:PORT**  
* Privkey: **Masternode Private Key**  
* TxHash: **First value from Step 6**  
* Output index:  **Second value from Step 6**  

For example :

MN01 144.217.161.212:9919 7aT4BojnsqsFNqBkA2296iQBSoeWTKHZ3gXqzZcnJQuXdrqjG1W ff6ec4ed0e3a3504c6028afac755aefb4734755579c07073abd408bb33b0c11b 1

9. Save & Exit ㅡ**Masternodes.conf**
10. Click **Start All**  


***

## Multiple MN on one VPS:

It is possible to run multiple **Sanchezium** Master Nodes on the same VPS. Each MN will run under a different user you will choose during installation.  

***


## Usage:  

For security reasons **Sanchezium** is installed under **sanchezium** user, hence you need to **su - sanchezium** before checking:    

```
SNCZ_USER=sanchezium #replace sanchezium with the MN username you want to check

su - $SNCS_USER
Sancheziumd masternode status
Sancheziumd getinfo
```  

Also, if you want to check/start/stop **Sancheziumd** , run one of the following commands as **root**:

```
SNCZ_USER=sanchezium  #replace sanchezium with the MN username you want to check  
  
systemctl status $SNCZ_USER #To check the service is running.  
systemctl start $SNCZ_USER #To start SancheziumD service.  
systemctl stop $ASNCZ_USER #To stop SancheziumD service.  
systemctl is-enabled $SNCZ_USER #To check whetether SancheziumD service is enabled on boot or not.  
```  

***

Any donation is highly appreciated  

**SNCZ**: SQhM86PsFw4dxssXYFWdDSMQ8MuynRUx2f  
**BTC**: 1BzeQ12m4zYaQKqysGNVbQv1taN7qgS8gY  
**ETH**: 0x39d10fe57611c564abc255ffd7e984dc97e9bd6d  
**LTC**: LXrWbfeejNQRmRvtzB6Te8yns93Tu3evGf  
