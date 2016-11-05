# for mecab issue 
url: http://milk-tea.myvnc.com/blog/adiary.cgi/0236

sudo -i
cd
apt-get install build-essential checkinstall && apt-get build-dep imagemagick -y
wget http://www.imagemagick.org/download/ImageMagick-6.8.7-7.tar.gz
tar xzvf ImageMagick-6.8.9-1.tar.gz
cd ImageMagick-6.8.9-1/
./configure --prefix=/opt/imagemagick-6.8 && make
checkinstall
