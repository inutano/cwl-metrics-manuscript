#!/bin/sh
# Launch Jupyter notebook docker container
docker run -it --rm -v $(pwd):/home/jovyan/work -p 8888:8888 jupyter/r-notebook:c54800018c2c
