FROM docker.io/centos

#修改中文支持
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum -y install kde-l10n-Chinese && yum -y reinstall glibc-common \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
#themis
RUN cd /usr/local \
    && yum -y install epel-release \
    && yum -y install git python2-pip python-devel gcc mysql-devel\
    && pip install virtualenv -i https://mirrors.ustc.edu.cn/pypi/web/simple/ \
    && adduser themis-test 
USER  themis-test
RUN cd /home/themis-test \
    && virtualenv python-project --python=python2.7 \
    && source /home/themis-test/python-project/bin/activate \    
    && pip install supervisor -i https://mirrors.ustc.edu.cn/pypi/web/simple/ \
    && git clone -b dev https://github.com/hhyo/Themis.git \
    && cd /home/themis-test/Themis \
    && pip install -r requirement.txt -i https://mirrors.ustc.edu.cn/pypi/web/simple/ \
    && git clone https://github.com/hanxiaomax/pyh.git \
    && cd pyh \
    && python setup.py install 


ENV LANG en_US.UTF-8
ENV LC_ALL zh_CN.utf8

#port
EXPOSE 7000

#start service
ENTRYPOINT bash /home/themis-test/Themis/dockersrc/start.sh && bash 
