# Valkyrie LCM Distro [![Build Status](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro.svg?branch=master)](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro)
Distro to be installed on the Valkyrie onboard computers (``link`` for now) in order to be able to use LCM and bot-procman.

## Instructions

**On Link, Zelda and vis04**
1. Clone this repository directly into ``~/openhumanoids``: ``cd && mkdir openhumanoids && cd openhumanoids && git clone https://github.com/openhumanoids/valkyrie-lcm-distro.git``
2. (Link, Zelda only) Create a new file under ``~/.val_config.d/51_valkyrie_lcm_distro`` with the following contents:
```
#!/bin/bash
export DISTRO_BASE="/home/val/openhumanoids/valkyrie-lcm-distro"

export PATH=$PATH:$DISTRO_BASE/build/bin
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$DISTRO_BASE/build/lib:$DISTRO_BASE/build/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$DISTRO_BASE/build/lib/pkgconfig:$DISTRO_BASE/build/lib64/pkgconfig:$PKG_CONFIG_PATH
export PYTHONPATH=$DISTRO_BASE/build/lib/python2.7/dist-packages:$PYTHONPATH
```

4. Copy scripts with the corresponding name (link/zelda/vis04) from ``~/openhumanoids/valkyrie-lcm-distro/systemd/`` to ``/etc/systemd/system/``
4. (Link, Zelda only) Re-source via ``source ~/.bashrc``
5. (Link, Zelda only) Compile
6. To set up the start of the services during boot: 
```systemctl daemon-reload
systemctl enable my_systemd_script.service
systemctl start my_systemd_script.service
```
7. (vis04 only) run ```cp ~/openhumanoids/valkyrie-lcm-distro/upstart/valkyrie_lcm_distro.bash ~/valkyrie_lcm_distro.bash```
7. Reboot and you're set :)

## Dependencies
(not complete)

```
build-essential cmake libglib2.0-dev git wget unzip
```
