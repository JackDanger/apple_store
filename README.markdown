# Apple Store

Sit down to any demo box in an Apple Retail Store (or any
Leopard system) and have Git, RubyGems 1.3.1 and SQLite3
working for you in less than a minute.

## How To:

Paste the following into Terminal.app on any Mac:

    mkdir -p work && cd work
    curl http://tinyurl.com/pwn-apple > install
    /bin/bash ./install

Then, when you're ready to leave:

    cd .. && rm -rf work

And it's like you were never there.

## Features

You can work at the Apple Store. Or on your wife's/husband's computer.
Or on a school computer. You don't need root access or XCode
installed to get yourself going.

It doesn't install any files outside of the current
directory.  You can delete the folder you installed it
from and the system will revert to it's previous, boring,
condition.


## Should I fork this and make it install stuff _*I*_ like?

Yes.
