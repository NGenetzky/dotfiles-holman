cd /tmp
git clone https://github.com/skibyte/gdblib.git gdblib
cd gdblib

python2 setup.py build
python2 setup.py install

cd ../
rm gdblib/ -r
