# Valkyrie LCM Distro [![Build Status](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro.svg?branch=master)](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro)
Distro to be installed on the Valkyrie onboard computers (``link`` for now) in order to be able to use LCM and bot-procman.

## Instructions

1. Clone this repository directly into ``~/openhumanoids``: ``cd && mkdir openhumanoids && git clone https://github.com/openhumanoids/valkyrie-lcm-distro.git``
2. Create a new file under ``~/.bash.nasa.val.d/50_valkyrie_lcm_distro`` with the following contents:
```
#!/bin/bash
export DISTRO_BASE="/home/val/openhumanoids/valkyrie-lcm-distro"

export PATH=$PATH:$DISTRO_BASE/build/bin
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$DISTRO_BASE/build/lib:$DISTRO_BASE/build/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$DISTRO_BASE/build/lib/pkgconfig:$DISTRO_BASE/build/lib64/pkgconfig:$PKG_CONFIG_PATH
# TODO: python path
```

3. Copy the system V init script to /etc/init.d/valkyrie_lcm_distro
4. Re-source via ``source ~/.bashrc``
5. Compile
6. Reboot and you're set :)

For more information on the system V init script, cf. [here](https://github.com/fhd/init-script-template).

## Dependencies
(not complete)

```
build-essential cmake libglib2.0-dev git wget unzip
```
