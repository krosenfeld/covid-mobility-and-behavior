# https://github.com/jupyter/docker-stacks/blob/main/datascience-notebook/Dockerfile

FROM jupyter/datascience-notebook:python-3.8    

WORKDIR /covid-mobility-and-behavior

# Copy project files (maybe we don't need to do all of them - it would be nice to work on the local notebooks)
COPY --chown=1000:100 ./ /covid-mobility-and-behavior

# RUN pip install --no-cache-dir --upgrade -r /covid-mobility-and-behavior/requirements.txt
RUN pip install -r /covid-mobility-and-behavior/requirements.txt

# make the dataset
RUN python3 src/data/make_dataset.py

# RUN Rscript /covid-mobility-and-behavior/install.R 

CMD ["jupyter", "notebook", "--no-browser", "--port=8889"]