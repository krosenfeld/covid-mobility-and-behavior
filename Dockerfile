# https://github.com/jupyter/docker-stacks/blob/main/datascience-notebook/Dockerfile

FROM jupyter/datascience-notebook:python-3.8    

WORKDIR /covid-mobility-and-behavior

COPY ./ /covid-mobility-and-behavior

# This should not be necessary...
# RUN mamba install --quiet --yes notebook

# RUN pip install --no-cache-dir --upgrade -r /covid-mobility-and-behavior/requirements.txt
RUN pip install -r /covid-mobility-and-behavior/requirements.txt

# make the dataset
RUN python3 src/data/make_dataset.py


# RUN Rscript /covid-mobility-and-behavior/install.R 

# make the synthetic dataset?
# RUN Rscript /demo/make-synthetic-wa.R

CMD ["jupyter", "notebook", "--no-browser", "--port=8889"]