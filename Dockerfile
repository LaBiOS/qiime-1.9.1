FROM vimalkvn/qiime
MAINTAINER Fabiano Menegidio

USER root

RUN pip install vsearch \
    && ln -s $(which vsearch) /bin/usearch61 \
    && chmod +x /opt/qiime_deps/activate.sh \
    && /opt/qiime_deps/activate.sh
