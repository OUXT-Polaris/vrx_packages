# ROS packages for Virtual Maritime RobotX Challenge

## Requirements
Ubuntu : 18.04  
ROS : Melodic  

## how to setup
### install ROS melodic  

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'  

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116  

sudo apt update  

sudo apt install ros-melodic-desktop-full  

sudo rosdep init

rosdep update

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

### install Python3 and Colcon

```
sudo apt install -y python3-pip python3-setuptools
sudo pip3 install -U setuptools
sudo apt install -y python3-colcon-common-extensions
```

### make catkin workspace

```
mkdir -p ~/vrx_ws/src
cd ~/vrx_ws/src
catkin_init_workspace
cd ../
colcon build
```

### install vcstool

```
sudo pip install vcstool
```

### clone vrx_packages and install dependency

```
cd ~/vrx_ws/src
git clone https://github.com/OUXT-Polaris/vrx_packages.git
cd vrx_packages
vcs import < dependencies.rosinstall
```

### build packages

```
cd ~/vrx_ws
rosdep install -i -r -y --from-paths src --rosdistro melodic
colcon build
```

### Requirement
cuda 10.0
cudnn 7.5
