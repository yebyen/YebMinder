FROM yebyen/baseimage:amd64
RUN apt-get update && apt-get install -y curl git mongodb && apt-get clean
ADD _gemrc /root/.gemrc
RUN \curl -sSL https://get.rvm.io | bash -s stable --rails --auto-dotfiles && apt-get clean
ADD . /bees
RUN echo 'cd /bees/urlminder && bundle' | bash --login -s
CMD mkdir -p /etc/service/mongodb
ADD sv_mongodb /etc/service/mongodb/run
CMD ["/sbin/my_init", "--enable-insecure-key"]
