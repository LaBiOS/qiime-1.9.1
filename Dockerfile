FROM vimalkvn/qiime
MAINTAINER Fabiano Menegidio

USER root

RUN chmod +x /opt/qiime_deps/activate.sh \
    && /opt/qiime_deps/activate.sh
