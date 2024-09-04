FROM ghcr.io/penguincloud/web2py-core:latest AS BUILD
# FROM ghcr.io/penguincloud/core:v5.0.1 AS BUILD
LABEL company="Penguin Tech Group LLC"
LABEL org.opencontainers.image.authors="info@penguintech.group"
LABEL license="GNU AGPL3"

# GET THE FILES WHERE WE NEED THEM!
COPY . /opt/manager/marketplace_manager/
WORKDIR /opt/manager/marketplace_manager


# PUT YER ARGS in here
ARG APP_TITLE="Marketplace Manager" # Change this to actual title for Default

# BUILD IT!
RUN ansible-playbook build.yml -c local

# PUT YER ENVS in here
ENV HELLO="WORLD"

# Switch to non-root user
USER ptg-user

# Entrypoint time (aka runtime)
ENTRYPOINT ["/bin/bash","/opt/manager/entrypoint.sh"]
