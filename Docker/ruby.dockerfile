FROM ruby:2.6

RUN apt-get update -y && apt-get install software-properties-common -y

RUN apt install zsh -y
RUN sed s/required/sufficient/g -i /etc/pam.d/chsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y


RUN \curl -sSL https://deb.nodesource.com/setup_6.x
RUN apt-get update
RUN apt-get install nodejs -y
RUN gem install rails -v 5.2

WORKDIR /var/www

EXPOSE 3000

ENTRYPOINT [ "zsh" ]