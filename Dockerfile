FROM jupyter/datascience-notebook:f646d2b2a3af
USER root
WORKDIR /home/jovyan
COPY . /home/jovyan

EXPOSE 80
EXPOSE 8888

RUN pip install -r /home/jovyan/requirements.txt

RUN echo "c.NotebookApp.ip = '0.0.0.0'" > ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.extra_template_paths = ['/home/jovyan/.html_files','...html/templates','...html']" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.port = 80" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.allow_origin = '*'" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.password = 'sha1:3efc472a30b9:6320e471692e9224957bd4ea358116df997980ed'" >> ~/.jupyter/jupyter_notebook_config.py 


CMD jupyter notebook --allow-root
