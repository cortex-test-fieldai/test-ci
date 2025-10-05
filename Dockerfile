FROM ros:iron-ros-base

# Install only what you need
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /ros2_ws

# Initialize rosdep
RUN rosdep init && rosdep update

# Your application code here
COPY . .

# Build (uncomment when you have source code)
# RUN /bin/bash -c "source /opt/ros/iron/setup.bash && colcon build"

CMD ["bash"]