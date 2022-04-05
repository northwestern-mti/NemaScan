FROM continuumio/miniconda
MAINTAINER Katie Evans <kathrynevans2015@u.northwestern.edu>

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

RUN apt-get --allow-releaseinfo-change update && apt-get install -y procps  
# RUN R -e "install.packages('mediation',dependencies=TRUE, repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.us.r-project.org')"
RUN R -e "BiocManager::install('MultiMed')"
RUN Rscript -e "install.packages('devtools', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"
RUN R -e "devtools::install_github('kosukeimai/mediation', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"