# simulation_aperiodSchr

**This repository is push mirrored to [https://github.com/eltenedor/simulation_aperiodSchr]()**

Simulaton Code for "Finite Section Method for Aperiodic Schrödinger Operators"

https://arxiv.org/abs/2104.00711

# Point and Band Spectrum

Run `seaweed_demo_K{4,5,9}` with configuration files in `/data` and get output files `/data`. Compare with output in `/archive`

Alternatively run the following docker command
```bash
docker run -i --rm -v "$PWD":/usr/src/app -w /usr/src/app eltenedor/octave-w-image-signal octave --no-gui seaweed_demo_K4.m
```

# Lower Norm

Example Application

# Exhaustive Example Check of Scalings of Periodic Potentials

