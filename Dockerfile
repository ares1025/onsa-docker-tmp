############################################################
# MHY opennsa docker image builder.
# Tested with Geant OpenNSA from here with testing branch only!
# $ git clone https://bitbucket.software.geant.org/scm/ccs/opennsa.git
# $ git checkout testing
# 
# Create an image like this:
#     cd /path/to/opennsa-repo-dir
#     docker build -t opennsa_img:VERSION -f /path/to/this/Dockerfile .
#     Check by running sudo docker run -t opennsa_img, but expets to be used with docker-compose
############################################################
FROM ubuntu
LABEL maintainer="Michal Hazlinsky <hazlinsky@cesnet.cz>"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y python3 python3-pip libssl-dev python3-dev build-essential
# some packages usefull for development (not for production)
#RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential
ADD . /opennsa
WORKDIR /opennsa
RUN pip3 install -r /opennsa/requirements.txt
ENV PYTHONPATH=/opennsa
CMD echo "Image is ment to be used with docker-compose. No parametters rescived now, OpenNSA service is not running."