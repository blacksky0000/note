
FROM ubuntu:14.04

ENV MY_HOME /root

# update
RUN apt-get update

# Pre Install tools
RUN apt-get install -y git vim curl tmux wget

# networks
RUN apt-get install -y net-tools iputils-ping

# rubys
RUN apt-get install -y ruby-dev mecab ruby

# useful packages.
RUN apt-get install -y build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev libpq-dev
RUN apt-get install -y git-core libreadline-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

RUN hash -r

# rvm for ruby
RUN cd
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN exec $SHELL

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
RUN exec $SHELL

RUN source $MY_HOME/.bashrc

RUN rbenv install 2.3.1
RUN rbenv global 2.3.1
RUN ruby -v

#rails bundle
RUN gem install bundler

ADD Gemfile $MY_HOME/Gemfile
RUN cd $MY_HOME
RUN bundle

# ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip $MY_HOME
RUN mv $MY_HOME/ngrok /bin
RUN hash -r

#port mapping
EXPOSE 3000 3000
EXPOSE 3001 3001
EXPOSE 3002 3002
EXPOSE 3003 3003



