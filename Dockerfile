# FROM osrf/ros:humble-desktop-full
# # FROM ros:humble

# RUN apt-get update && apt-get install -y nano && rm -rf /var/lib/apt/lists/*

# COPY config/ /site_config/

# ARG USERNAME=ros
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# # Create a non-root user
# RUN groupadd --gid $USER_UID $USERNAME \
#     && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME  \
#     && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config




# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# ROS Noetic

FROM osrf/ros:noetic-desktop-full 
ARG USER=user 
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get install -y ros-noetic-moveit ros-noetic-ros-controllers ros-noetic-gazebo-ros-control ros-noetic-rosserial ros-noetic-rosserial-arduino ros-noetic-roboticsgroup-upatras-gazebo-plugins ros-noetic-actionlib-tools terminator python3-pip && rm -rf /var/lib/apt/lists/*
RUN pip3 install flask flask-ask-sdk ask-sdk 

RUN apt-get update && apt-get install -y nano && rm -rf /var/lib/apt/lists/*

WORKDIR /home/$USER


# sudo docker run -it --rm --user=$(id -u $USER):$(id -g $USER) -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 --env="DISPLAY" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --net host -v /home:/home -v ~/Volumes:/home/usr/ ros-noetic-container
