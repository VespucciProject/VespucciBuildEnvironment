apt-get -y update
apt-get -y install --no-install-recommends \
    apt-utils \
    git \
    curl \
    liblapack-dev \
    build-essential \
    libopenblas-dev \
    cmake \
    libhdf5-dev \
    libxml2-dev \
    libsz2 \
    libboost-all-dev
mkdir -p /build/dependencies
cd /build/dependencies

mkdir -p /src/build

chmod +x /build/linuxdeployqt
cp /build/linuxdeployqt /usr/bin

# compile armadillo
curl -k https://github.com/dpfoose/numerical-environment/releases/download/1/armadillo-7.800.1.tar.xz > armadillo.tar.xz
tar xvf armadillo.tar.xz
mkdir armadillo-7.800.1/build && cd armadillo-7.800.1/build
cmake ..
make && make install
cd ../..

# compile mlpack
curl http://mlpack.org/files/mlpack-2.1.1.tar.gz > mlpack.tar.gz
tar xvf mlpack.tar.gz
mkdir mlpack-2.1.1/build && cd mlpack-2.1.1/build
cmake .. -DBUILD_TESTS:BOOL=OFF -DBUILD_CLI_EXECUTABLES:BOOL=OFF
make && make install
cd ../..
