#!/bin/bash
docker run -ti --rm \
       -e DISPLAY \
       -v $HOME/.Xauthority:/home/slottad/.Xauthority \
       --net=host \
       slottad/hpglview
