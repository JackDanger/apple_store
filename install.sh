
mkdir -p _work
cd _work

## Retrieve Git
curl -Ov http://git-osx-installer.googlecode.com/files/git-1.6.1.1-intel-leopard.dmg
# cp ../../git.dmg ./git-1.6.1.1-intel-leopard.dmg

## Install Git from the DMG file
hdiutil attach git*.dmg
cp /Volumes/Git-1.6.1.1-Intel-Leopard/git-1.6.1.1-intel-leopard.pkg ./
hdiutil detach /Volumes/Git-*Intel-Leopard/
sudo installer -pkg git*.pkg -target "/"

## Install Rubygems from source
curl -OLv http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz
tar -xvf rubygems*.tgz
rm rubygems.tgz
cd rubygems*
ruby setup.rb



