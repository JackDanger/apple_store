
HERE=`pwd`
mkdir -p $HERE/src
mkdir -p $HERE/bin
mkdir -p $HERE/git
mkdir -p $HERE/.gems

## Setup local environment
cat > $HERE/bash_env <<-EOF
export GEM_HOME="$HERE/.gems"
export GEM_PATH="\$GEM_HOME:/usr/lib/ruby/gems/1.8"
export PATH="$HERE/bin:$HERE/git/bin:$HERE/git/libexec/git-core/:$HERE/.gems/bin:\$PATH"
EOF
source $HERE/bash_env


## Retrieve Git
cd $HERE/src
curl -OL http://git-osx-installer.googlecode.com/files/git-1.6.1.1-intel-leopard.dmg

## Extract Git binaries from the DMG file
cd $HERE/src
hdiutil attach git*.dmg
cp /Volumes/Git-1.6.1.1-Intel-Leopard/git-1.6.1.1-intel-leopard.pkg ./
hdiutil detach /Volumes/Git-*Intel-Leopard/
xar -x -f git-*.pkg
mv git.pkg/Payload git.pkg/Payload.gz
gunzip git.pkg/Payload.gz
ditto -x git.pkg/Payload  $HERE/src
rm -rf System Resources Distribution etc.pkg git.pkg
## Installing Git to $HERE/git
mv lib libexec man share contrib bin $HERE/git/


## Install Rubygems from source
cd $HERE/src
curl -OLv http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz
tar -xvf rubygems*.tgz
rm rubygems.tgz
cd rubygems*
ruby setup.rb --prefix=$HERE >/dev/null
echo "You're using RubyGems version `gem -v`"



## Retrieve and Install SQLite Binary
cd $HERE/src
curl -OL http://www.sqlite.org/sqlite3-3.6.10-osx-x86.bin.gz
gunzip sqlite*.gz
mv sqlite*.bin $HERE/bin
ln -s $HERE/bin/sqlite*.bin $HERE/bin/sqlite
ln -s $HERE/bin/sqlite*.bin $HERE/bin/sqlite3

echo "
You'll need to type the following command each time you want
a terminal session to work for you:

    source $HERE/bash_env
"

## Install some gems you'll almost certainly need
gem install rails rack sqlite3 --no-ri --no-rdoc