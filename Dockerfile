# https://github.com/jupyter/docker-stacks/blob/main/datascience-notebook/Dockerfile

FROM jupyter/datascience-notebook:python-3.8    

# set working directory
WORKDIR /covid-mobility-and-behavior

# Copy project files (maybe we don't need to do all of them - it would be nice to work on the local notebooks)
COPY --chown=1000:100 ./ /covid-mobility-and-behavior

# install python elements
RUN pip install --no-cache-dir --upgrade -r /covid-mobility-and-behavior/requirements.txt

# make the test dataset
RUN python3 src/data/make_dataset.py

# install R dependencies
RUN mamba install --quiet --yes \
    'r-mclust' \
    'r-dplyr' \
    'r-tidycensus' \
    'r-data.table' \
    'r-clinfun' \
    'r-sf' \
    'r-jsonlite' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


# Allows root which seems dangerous
CMD ["jupyter", "lab", "--no-browser", "--port=8889", "--allow-root", "/app"]