# In this Docker container layer, we install some common libraries:
#
# * plyr
# * jsonlite
# * rjstat
# * yaml
# * whisker
# * magrittr
#
# Other libraries are already present from r-recommends package such as:
# * MASS
# * Matrix
# * cluster
# * foreign
# * rpart


FROM hbpmip/r-mip:latest

MAINTAINER ludovic.claude54@gmail.com

RUN exec install2.r --error plyr jsonlite rjstat yaml whisker magrittr \
    && rm -rf /tmp/*
