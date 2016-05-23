
/* run 32bit on 64bit machine.*/
//for ubuntu < 12.02
#echo "foreign-architecture i386" > /etc/dpkg/dpkg.cfg.d/multiarch
sudo apt-get --add-architecture i386

//if need
#sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386

