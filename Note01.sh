#Adding alias presistly
#installed zsh.
echo 'alias lll="ls -a"' >> ~/.zshrc && source ~/.zshrc

#Plugins enable.
sed -e "s/plugins=(git/plugins=(git pip macports screen/g" .zshrc && source ~/.zshrc



