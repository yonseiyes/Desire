
# DesireCoin
Shell script to install a [Desire Masternode] on a Linux server running Ubuntu 16.04. Use it on your own risk.  

***
## Installation:  
Copy & Paste below in Command line of VPS server & Press 'Enter'

git clone https://github.com/yonseiyes/desirescript.git ;
cd desirescript ;
chmod +x desirescript.sh ;
./desirescript.sh ;


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
* Privkey: **Masternode Private Key**   **which is shown in command line of VPS server when compiling finished.**
* TxHash: **First value from Step 6**  
* Output index:  **Second value from Step 6**  

For example :

MN01 144.217.161.212:9919 7aT4BojnsqsFNqBkA2296iQBSoeWTKHZ3gXqzZcnJQuXdrqjG1W ff6ec4ed0e3a3504c6028afac755aefb4734755579c07073abd408bb33b0c11b 0

9. Save & Exit **Masternode.conf** 
10. Restart Desire Wallet  
11. Click **Start All** in Masternode tab


***
Any donation is highly appreciated  

**DSR**: DSW1WhnRYSsy8jqRW7nBZbKLDs9LCUXKif   
**BTC**: 15Q8Yx2URrtS8SHcJsa1v9ofaSV6Ks5bjx 
