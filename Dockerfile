FROM ros:indigo

RUN apt-get update \
        && apt-get install -y g++ \
        && rm -rf /var/lib/apt/lists/*

ENV CATKIN_WORKSPACE /workspace
ENV USER_WORKSPACE $CATKIN_WORKSPACE/src
 
RUN mkdir $CATKIN_WORKSPACE
RUN mkdir $USER_WORKSPACE

RUN /bin/bash -c "source /ros_entrypoint.sh \
        && cd $USER_WORKSPACE \
        && catkin_init_workspace \
        && cd $CATKIN_WORKSPACE \
        && catkin_make"

WORKDIR $USER_WORKSPACE

