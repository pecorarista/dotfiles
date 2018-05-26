export LC_TIME="en_US.UTF-8"
export LC_COLLATE="C"

if [ -f /etc/debian_version ]
then
    export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
fi

texlive_home=/usr/local/texlive/2018
export MANPATH=$MANPATH:$texlive/texmf-dist/doc/man
export INFOPATH=$INFOPATH:$texlive/texmf-dist/doc/info

if which ruby > /dev/null
then
    export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
fi

ANACONDA_HOME=$HOME/anaconda3
source $ANACONDA_HOME/bin/activate

path=(
    $texlive_home/bin/x86_64-linux
    $GEM_HOME/bin
    $HOME/.cargo/bin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.local/share/umake/bin
    $path
)

# OCaml
source $HOME/.opam/opam-init/init.zsh 2> /dev/null || true
