FROM vimalkvn/qiime
MAINTAINER Fabiano Menegidio

USER root

ADD usearch61 /bin/usearch61
ADD fasta-splitter.pl /bin/fasta-splitter.pl

RUN chmod +x /opt/qiime_deps/activate.sh \
    && /opt/qiime_deps/activate.sh \
    && chmod +x /bin/usearch61 \
    && git clone https://github.com/lh3/seqtk.git \
    && cd seqtk && make \
    && chmod +x /bin/fasta-splitter.pl
