# Valkyrie LCM Distro [![Build Status](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro.svg?branch=master)](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro)
Distro to be installed on the Valkyrie onboard computers (``link`` for now) in order to be able to use LCM and bot-procman.

## Instructions

**On Link and Zelda**
1. Clone this repository directly into ``~/openhumanoids``: ``cd && mkdir openhumanoids && git clone https://github.com/openhumanoids/valkyrie-lcm-distro.git``
2. Create a new file under ``~/.bash.nasa.val.d/50_valkyrie_lcm_distro`` with the following contents:
```
#!/bin/bash
export DISTRO_BASE="/home/val/openhumanoids/valkyrie-lcm-distro"

export PATH=$PATH:$DISTRO_BASE/build/bin
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$DISTRO_BASE/build/lib:$DISTRO_BASE/build/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$DISTRO_BASE/build/lib/pkgconfig:$DISTRO_BASE/build/lib64/pkgconfig:$PKG_CONFIG_PATH
export PYTHONPATH=$DISTRO_BASE/build/lib/python2.7/dist-packages:$PYTHONPATH
```

3. Copy the scripts under init.d to ``/etc/init.d/``
4. Copy scripts with the corresponding name (link/zelda) from ``upstart`` to ``/etc/init/``
4. Re-source via ``source ~/.bashrc``
5. Compile
6. To set up the start of the services during boot: ``update-rc.d valkyrie_lcm_distro_bot_lcm_tunnel defaults``; ``update-rc.d valkyrie_lcm_distro_bot_procman_deputy defaults``
7. Reboot and you're set :)
8. To uninstall ``sudo service valkyrie_lcm_distro_bot_lcm_tunnel uninstall`` and ``sudo service valkyrie_lcm_distro_bot_procman_deputy uninstall``

For more information on the system V init script, cf. [here](https://github.com/fhd/init-script-template).

## Dependencies
(not complete)

```
build-essential cmake libglib2.0-dev git wget unzip
```
