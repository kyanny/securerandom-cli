# Easy to use SecureRandom from CLI

`securerandom.rb` is a utility script for easy to use Ruby's SecureRandom library from CLI.

## How to install

    $ git clone git://github.com/kyanny/securerandom-cli.git
    $ cp securerandom-cli/securerandom.rb ~/bin
    $ cd ~/bin
    $ ./securerandom.rb --install
    $ hex --help

`securerandom.rb --install` creates a link with the same name as the method of SecureRandom library.

## How to use

    $ hex --help # display usage
    $ hex 10     # display 20-bytes length hexdigest
    $ uuid       # display uuid
