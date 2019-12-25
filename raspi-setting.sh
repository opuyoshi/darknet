cd ~

# install PeachPy and confu
sudo pip3 install --upgrade git+https://github.com/Maratyszcza/PeachPy
sudo pip3 install --upgrade git+https://github.com/Maratyszcza/confu

# install Ninja
git clone https://github.com/ninja-build/ninja.git
cd ninja
git checkout release
./configure.py --bootstrap
export NINJA_PATH=$PWD

# install clang
sudo apt-get install clang

# install NNPACK-darknet
git clone https://github.com/digitalbrain79/NNPACK-darknet.git
cd NNPACK-darknet
python3 configure.py --backend auto
$NINJA_PATH/ninja
sudo cp -a lib/* /usr/lib/
sudo cp include/nnpack.h/ /usr/include/
sudo cp deps/pthreadpool/include/pthreadpool.h /usr/include/

# Build darknet-nnpack
git clone https://github.com/digitalbrain79/darknet-nnpack.git
cd darknet-nnpack
make
