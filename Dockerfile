FROM yebyen/baseimage:i386
RUN apt-get update && apt-get install -y curl git && apt-get clean
ADD _gemrc /root/.gemrc
RUN \curl -sSL https://get.rvm.io | bash -s stable --rails --auto-dotfiles && apt-get clean
ADD . /bees
CMD ["/bin/bash", "--login"]
