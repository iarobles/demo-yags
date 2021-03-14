FROM gapsystem/gap-docker

COPY --chown=1000:1000 . $HOME/mygapproject

RUN sudo pip3 install ipywidgets RISE

RUN jupyter-nbextension install rise --user --py

RUN jupyter-nbextension enable rise --user --py

RUN mkdir -p $HOME/.gap/pkg

RUN git clone -b ismael https://github.com/yags/yags.git

RUN cp -rf yags $HOME/.gap/pkg

USER gap

WORKDIR $HOME/mygapproject
