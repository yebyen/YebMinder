FROM yebyen/ubuntu:i386
RUN apt-get update && apt-get install -y curl git && apt-get clean
ADD _gemrc /.gemrc
RUN \curl -sSL https://get.rvm.io | bash -s stable --rails
ADD . /bees
CMD ["/bin/bash", "--login"]
