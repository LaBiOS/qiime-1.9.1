FROM jcrist/alpine-conda:4.6.8

ENV CONDA /opt/conda/
ENV PATH $CONDA:$PATH

ADD spec-file.txt /tools/spec-file.txt
ADD others-file.txt /tools/others-file.txt
ADD r-file.txt /tools/r-file.txt
ADD bioconductor-file.txt /tools/bioconductor-file.txt

RUN /opt/conda/bin/conda install --yes --freeze-installed \
        dask==1.2.2 \
        numpy==1.16.3 \
        pandas==0.24.2 \
        nomkl \
    && /opt/conda/bin/conda install --yes --freeze-installed --file /tools/spec-file.txt \
    && /opt/conda/bin/conda install --yes --freeze-installed --file /tools/others-file.txt \
    && /opt/conda/bin/conda install --yes --freeze-installed --file /tools/r-file.txt \
    && /opt/conda/bin/conda install --yes --freeze-installed --file /tools/bioconductor-file.txt \
    && /opt/conda/bin/conda clean -afy \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete
