FROM vimalkvn/qiime
MAINTAINER Fabiano Menegidio

USER root

ADD usearch61 /bin/usearch61 \
    && chmod +x /bin/usearch61 \
    && git clone https://github.com/lh3/seqtk.git \
    && cd seqtk && make \
    && 

RUN chmod +x /opt/qiime_deps/activate.sh \
    && /opt/qiime_deps/activate.sh
