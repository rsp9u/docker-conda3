FROM centos:7

# Install Anaconda
RUN yum install -y \
    libXcomposite libXcursor libXi libXtst \
	libXrandr alsa-lib mesa-libEGL libXdamage \
	mesa-libGL libXScrnSaver

RUN curl -Lo ~/anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
RUN mkdir -p /opt && bash ~/anaconda.sh -b -p /opt/conda
RUN rm -f ~/anaconda.sh && yum clean all

# Set ja locale
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
