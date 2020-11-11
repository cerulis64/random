FROM archlinux:latest

LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="archlinux-toolbox" \
      version="latest" \
      usage="archlinux image compatible with toolbox"

# optimize mirrors
RUN pacman --noconfirm -Syu reflector
RUN reflector --latest 200 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# install packages
RUN pacman --noconfirm -S base sudo base-devel grml-zsh-config kitty-terminfo reflector

RUN touch /etc/machine-id
RUN mkdir /media

# configure sudo
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

CMD /bin/zsh
