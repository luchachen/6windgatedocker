FROM ubuntu:18.04
MAINTAINER "Lucha Chen"

#cmake-3.28.0-rc6-linux-x86_64.sh
#cmake-3.28.0-rc6-linux-x86_64.tar.gz
COPY git.list misc.list /etc/apt/sources.list.d/
COPY vim.gpg trusted.gpg /etc/apt/trusted.gpg.d/
COPY gitconfig /root/.gitconfig
COPY vimrc /root/.vimrc
COPY inputrc  /root/.inputrc
#COPY vim/ /root/.vim/
WORKDIR /bin/
RUN ln -sf bash sh


# timezone
RUN apt update && apt install -y tzdata;

WORKDIR /root/
ADD packages.ntos /root/

RUN apt-cache dumpavail | dpkg --merge-avail \
    && dpkg --clear-selections && dpkg --set-selections < packages.ntos  && apt-get -y -u dselect-upgrade || echo "for manual"

RUN apt install -y install man-db coreutils dos2unix

# add git bash_complete
RUN apt install -y  --no-install-recommends --no-install-suggests  git-all

# YouCompleteme
RUN apt install -y python3.8-dev gcc-8 g++-8
# sshd
RUN mkdir /run/sshd; \
    apt install -y openssh-server; \
    sed -i 's/^#\(PermitRootLogin\) .*/\1 yes/' /etc/ssh/sshd_config; \
    sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config; \
    apt clean;

# entrypoint
RUN { \
    echo '#!/bin/bash -eu'; \
    echo 'ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime'; \
    echo 'echo "root:${ROOT_PASSWORD}" | chpasswd'; \
    echo 'exec "$@"'; \
    } > /usr/local/bin/entry_point.sh; \
    chmod +x /usr/local/bin/entry_point.sh;

ENV TZ Asia/Shanghai

ENV ROOT_PASSWORD root

EXPOSE 22

ENTRYPOINT ["entry_point.sh"]
CMD    ["/usr/sbin/sshd", "-D", "-e"]
