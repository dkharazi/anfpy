FROM jupyter/datascience-notebook:f646d2b2a3af
USER root
WORKDIR /home/jovyan

# TODO: Change this so we clone the notebook repo
RUN git clone https://github.com/pupster90/io_docker_setup.git
RUN cd ~/io_docker_setup && chmod +x Set_Computer.sh && ./Set_Computer.sh

EXPOSE 80
EXPOSE 8888
CMD ["jupyter","notebook"]
