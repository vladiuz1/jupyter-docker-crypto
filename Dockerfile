# Use the miminal-notebook as base container
ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    openssl libpq-dev libgmp3-dev

USER $NB_UID



# Copy the requirements.txt file
COPY requirements.txt requirements.txt

# Install all Python dependencies
RUN python3 -m pip install -r requirements.txt

# The base container takes care of the rest.

