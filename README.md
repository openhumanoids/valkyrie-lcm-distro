# Valkyrie LCM Distro [![Build Status](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro.svg?branch=master)](https://travis-ci.org/openhumanoids/valkyrie-lcm-distro)
Distro to be installed on ``link`` on Valkyrie to run LCM traffic to it.

## Instructions

1. Clone this repository directly into the home directory
2. Set up a bashrc script to load on default (i.e. place the following into ~/.bash.nasa.val.d/50_valkyrie_lcm_distro)
3. Copy the system V init script to /etc/init.d/valkyrie_lcm_distro
4. Source ~/.bashrc
5. Compile
6. Reboot and you're done :)

For more information on the system V init script, cf. [here](https://github.com/fhd/init-script-template).

## Dependencies
(not complete)

```
build-essential cmake libglib2.0-dev git wget unzip
```

