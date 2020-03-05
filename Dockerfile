FROM bioportainer/pyenv:cpu

ADD spec-file.txt /tools/spec-file.txt
ADD others-file.txt /tools/others-file.txt
ADD r-file.txt /tools/r-file.txt
ADD bioconductor-file.txt /tools/bioconductor-file.txt

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv virtualenv $PYTHON2_VERSION qiime \
    && pyenv global qiime \
    && pyenv activate qiime \
    && conda install --yes --no-update-deps \
        dask==1.2.2 \
        numpy==1.16.3 \
        pandas==0.24.2 \
        nomkl \
    && conda install --yes --no-update-deps --file /tools/spec-file.txt \
    && conda install --yes --no-update-deps --file /tools/others-file.txt \
    && conda install --yes --no-update-deps --file /tools/r-file.txt \
    && conda install --yes --no-update-deps --file /tools/bioconductor-file.txt \
    && conda clean -afy
