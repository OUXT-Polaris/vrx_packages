sudo apt -y install cmake
cd external
wget https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3-Linux-x86_64.tar.gz
tar -xvzf cmake-3.14.3-Linux-x86_64.tar.gz
# Install Nnabla
sudo apt -y install build-essential
sudo apt -y install python python-pip
sudo apt -y install libarchive-dev
sudo apt -y install libhdf5-dev
sudo add-apt-repository ppa:maarten-fonville/protobuf
sudo apt -y install protobuf-compiler libprotoc-dev libprotobuf-dev
cd nnabla
mkdir build
cd build
../../cmake-3.14.3-Linux-x86_64/bin/cmake ../ -DBUILD_CPP_UTILS=ON -DBUILD_PYTHON_PACKAGE=OFF -DNNABLA_UTILS_WITH_HDF5=ON
make -j $(nproc)
sudo make install
cd ../../
cd nnabla-ext-cuda
pip install -U -r python/requirements.txt
mkdir build
cd build
../../cmake-3.14.3-Linux-x86_64/bin/cmake -DNNABLA_DIR=../../nnabla -DCPPLIB_LIBRARY=../../nnabla/build/lib/libnnabla.so -DBUILD_PYTHON_PACKAGE=OFF -DBUILD_CPP_UTILS=ON ..
make -j $(nproc)
sudo make install