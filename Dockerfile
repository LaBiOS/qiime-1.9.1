FROM vimalkvn/qiime
MAINTAINER Fabiano Menegidio

USER root

ADD usearch61 /bin/usearch61
ADD fasta-splitter.pl /bin/fasta-splitter

RUN wget https://support.hdfgroup.org/ftp/HDF5/prev-releases/hdf5-1.10/hdf5-1.10.1/src/hdf5-1.10.1.tar.gz \
    && tar zxf hdf5-1.10.1.tar.gz \
    && mv hdf5-1.10.1 hdf5-setup \
    && cd hdf5-setup && ./configure --prefix=/usr/local/ \
    && make && make install \
    && cd .. && rm -rf hdf5* \
    && pip uninstall h5py && pip install h5py \
    && apt-get install -y python_requires wget \
    && chmod +x /opt/qiime_deps/activate.sh \
    && /opt/qiime_deps/activate.sh \
    && chmod +x /bin/usearch61 \
    && git clone https://github.com/lh3/seqtk.git \
    && cd seqtk && make \
    && chmod +x /bin/fasta-splitter \
    && apt-get -yq autoremove && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
