export PATH=/opt/compiler/gcc-4.8.2/bin:$PATH
autoreconf -fvi
./configure --enable-debug=full
make
rm -rf output
mkdir -p output/src
cp src/twemcache output/src || true
