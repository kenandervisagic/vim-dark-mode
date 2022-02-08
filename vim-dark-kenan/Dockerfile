FROM ubuntu:18.04

SHELL ["/bin/bash","-c","-l"]

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update && apt-get upgrade -y  && \ 
     DEBIAN_FRONTEND=noninteractive apt-get -y install unzip build-essential \
            python3-pip python-pip zlib1g-dev \
            pass tmux mosh bison curl git pv ninja-build wget flex patch lzma \
            libpng-dev p7zip-full sudo bash-completion apt-utils xclip bzip2 libncursesw5-dev \
            pkg-config automake libtool autoconf global libtool-bin gettext p7zip-full \
            locales locales-all software-properties-common libncurses5-dev ccache \
            libcurl4-openssl-dev distcc command-not-found traceroute iputils-ping \
            netcat-traditional gdb-multiarch nmap tcpdump iperf3 net-tools\
            bc libpcap-dev libssl-dev libmp3lame-dev libsoundio-dev libgmp-dev dnsutils\ 
            genisoimage rxvt-unicode libusb-1.0 \ 
            libopus0 libgtk-3-0 libepoxy0 libsasl2-2 libbz2-dev \
            libgstreamer-plugins-base1.0 liborc-0.4-0 libgbm1 \
            geany geany-plugin-addons geany-plugin-autoclose geany-plugin-codenav \
            geany-plugin-defineformat libreadline-dev qt5-default libgtk-3-dev &&\
            apt-get clean

RUN mkdir -p /opt1/ && \
    curl -sL https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.tar.gz  | tar zxf - --strip-components=1  -C /opt1 && \
    curl -sL http://releases.llvm.org/7.0.1/clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar Jxf - --strip-components=1 -C /opt1 && \
    curl -sL https://nodejs.org/dist/v12.3.1/node-v12.3.1-linux-x64.tar.xz | tar Jxf - --strip-components=1 -C /opt1 && \
    cd /opt1 && git clone '--depth=1' https://github.com/michaelforney/oasis-toolchain && \
    cd /tmp && git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls && \
    export PATH=$PATH:/opt1/bin && cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt1/ && \
    cmake --build Release && strip Release/ccls && mv Release/ccls /opt1/bin && rm -rf /tmp/* 

RUN cd /tmp && \
    curl -sL https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.bz2 | tar jxf - && \
    cd boost* && ./bootstrap.sh --prefix=/opt1/boost1.70 && ./b2 install -j 4 && cd / && rm -rf /tmp/*

ADD ccls_nvim.tar.gz /nvim/
ADD bin /opt1/bin/
ADD script.sh /opt1/
ADD tmux.conf /opt1/.tmux.conf
ADD ycm_nvim.tar.gz /nvim/
ADD ycm_extra_conf.py /nvim/.ycm_extra_conf.py
ADD inputrc  /opt1/.inputrc
ADD bashrc  /opt1/.bashrc

RUN export PATH=$PATH:/opt1/bin && cd /tmp && git clone https://github.com/neovim/neovim && cd neovim && \
    git checkout v0.3.4 && \
    make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/opt1" && \
    make install && \
    export PATH=/opt1/bin:$PATH && XDG_CONFIG_HOME=/nvim/.conf_cpp1 nvim +PlugInstall +qall --headless && \
    cd /nvim/.conf_cpp1/nvim/plugged/YouCompleteMe && \
    ./install.py --clang-completer --system-libclang  && chmod -R 777 /nvim && cd / && rm -rf /tmp/* && \
    XDG_CONFIG_HOME=/nvim/.conf_cpp3 nvim +PlugInstall +UpdateRemotePlugins +qall --headless 

RUN pip3 install neovim neovim-remote meson asciinema && pip install neovim 

