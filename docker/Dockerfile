FROM docker.io/gnuoctave/octave:6.2.0
RUN apt-get update -y \
    && apt-get install -y octave-image octave-signal \
    && printf "pkg load image\npkg load signal\n" >>~/.octaverc
CMD /bin/bash
