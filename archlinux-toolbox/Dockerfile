FROM archlinux:latest

LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="archlinux-toolbox" \
      version="latest" \
      usage="archlinux image compatible with toolbox"

RUN touch /etc/machine-id

RUN mkdir /media

RUN pacman --noconfirm -Syu base sudo
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

CMD /bin/sh
