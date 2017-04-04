apt-get -y update
apt-get -y install --no-install-recommends \
    apt-utils \
    git \
    wget \
    liblapack-dev \
    build-essential \
    libopenblas-dev \
    cmake \
    libhdf5-dev \
    libxml2-dev \
    libsz2 \
    libboost-all-dev \
    qtbase5-dev \
    libqt5svg5 \
    libqt5printsupport5 \
    libyaml-cpp-dev
mkdir -p /build/dependencies
cd /build/dependencies

mkdir -p /src/build

chmod +x /build/linuxdeployqt
cp /build/linuxdeployqt /usr/bin

# compile armadillo
wget --no-check-certificate https://github.com/VespucciProject/VespucciBuildEnvironment/releases/download/1.1/armadillo-7.800.1.tar.xz 
tar xvf armadillo-7.800.1.tar.xz
mkdir armadillo-7.800.1/build && cd armadillo-7.800.1/build
cmake ..
make && make install
cd ../..

# compile mlpack
wget http://mlpack.org/files/mlpack-2.1.1.tar.gz
tar xvf mlpack-2.1.1.tar.gz
mkdir mlpack-2.1.1/build && cd mlpack-2.1.1/build
cmake .. -DBUILD_TESTS:BOOL=OFF -DBUILD_CLI_EXECUTABLES:BOOL=OFF
make && make install
cd ../..

#get libemf
wget --no-check-certificate https://github.com/VespucciProject/VespucciBuildEnvironment/releases/download/1.1/libemf-1.0.9.tar.gz
tar xvf libemf-1.0.9.tar.gz
cd libemf-1.0.9.tar.gz
./configure
make && make install
cd ..

#get EmfEngine:
git clone https://github.com/VespucciProject/EmfEngineGPL.git
mkdir EmfEngineGPL/build
cd EmfEngineGPL/build
cmake ..
make && make install
cd ../..
