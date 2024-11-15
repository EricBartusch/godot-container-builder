FROM docker.io/barichello/godot-ci:4.3
ENV GODOT_VERSION=4.3
LABEL org.opencontainers.image.source="https://github.com/EricBartusch/godot-itch-deploy"

RUN apt-get update && apt-get install -y python3 python3-pip lsb-release curl

RUN pip3 install gdtoolkit

RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default && \
    unzip butler.zip && \
    chmod +x butler && \
    mv butler /usr/local/bin/butler

RUN mkdir -v -p /github/home/.local/share/godot/export_templates/${GODOT_VERSION}.stable

RUN mv -r /root/.local/share/godot/export_templates/${GODOT_VERSION}.stable /github/home/.local/share/godot/export_templates/${GODOT_VERSION}.stable/

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*