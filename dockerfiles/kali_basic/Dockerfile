
FROM kalilinux/kali-linux-docker

RUN apt-get update

ENV MY_HOME /root/

# Pre builds
RUN apt-get install -y zsh git vim

# Zsh (zprezto Theme)
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# for upgrade 
# RUN cd ${ZDOTDIR:-$HOME}/.zprezto
# RUN git pull && git submodule update --init --recursive

RUN zsh
ADD theme.sh $MY_HOME/theme.sh
RUN chmod +x $MY_HOME/theme.sh
RUN /bin/zsh $MY_HOME/theme.sh
RUN rm $MY_HOME/theme.sh
# RUN source /root/.zshrc


EXPOSE 8000 80

# Make working dir
RUN mkdir $MY_HOME/works

# install kali dependence. // it will take a long time.
# RUN apt-cache search kali-linux-web
# RUN apt-get install -y kali-linux-web