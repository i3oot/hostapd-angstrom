#/bin/sh

opkg install wget libnl-3-dev
wget http://w1.fi/releases/hostapd-2.2.tar.gz
tar zxvf hostapd-2.2.tar.gz
export DESTDIR=`pwd`/build
pushd hostapd-2.2/hostapd
cp defconfig .config
sed -r -i "s/#CONFIG_LIBNL32=y/CONFIG_LIBNL32=y/" .config
make
mkdir -p $DESTDIR/usr/local/bin
make install
popd
./ipkg-build build .

