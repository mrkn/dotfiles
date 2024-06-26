# Homebrew

arch=$(uname -m)
if [ "$arch" = "x86_64" ]; then
  export HOMEBREW_PREFIX=/opt/homebrew-x86_64
else
  export HOMEBREW_PREFIX=/opt/homebrew
fi

if [ -d /opt/brew ]; then
  export HOMEBREW_PREFIX=/opt/brew
fi

eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

export LD_LIBRARY_PATH=$HOMEBREW_PREFIX/lib${LD_LIBRARY_PATH+:$LD_LIBRARY_PATH}
export DYLD_FALLBACK_LIBRARY_PATH=$HOMEBREW_PREFIX/lib${DYLD_FALLBACK_LIBRARY_PATH+:$DYLD_FALLBACK_LIBRARY_PATH}
export C_INCLUDE_PATH=$HOMEBREW_PERFIX/include${C_INCLUDE_PATH+:$C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=$HOMEBREW_PREFIX/include${CPLUS_INCLUDE_PATH+:$CPLUS_INCLUDE_PATH}

# avr-gcc@7
export PATH="$HOMEBREW_PREFIX/opt/avr-gcc@7/bin:$PATH"

export LIBZMQ_PATH=$HOMEBREW_PREFIX/opt/zeromq/lib
export LIBCZMQ_PATH=$HOMEBREW_PREFIX/opt/czmq/lib
