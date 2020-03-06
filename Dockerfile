FROM vimalkvn/qiime
MAINTAINER Fabiano Menegidio

USER root

RUN pip install vsearch
    
USER qiime
