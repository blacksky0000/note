
#oh my zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#neovim
#sudo apt-get install software-properties-common

#vimrc
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh


#gdb install if need
sudo apt-get install gdb

#gdb-peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

#install GUI for Ubuntu server
sudo apt-get install -y ubuntu-desktop









#if [ "$1" = ""]
#fi
