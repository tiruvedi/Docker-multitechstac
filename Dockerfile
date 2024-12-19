# Base Image (dynamic selection)
ARG BASE_IMAGE
FROM ${BASE_IMAGE} AS base

# Set working directory
ARG WORKDIR
WORKDIR ${WORKDIR}

# Optional Build Stage
ARG BUILD_STAGE
ARG BUILD_COMMAND
RUN if [ ! -z "$BUILD_STAGE" ]; then $BUILD_COMMAND; fi

# Optional Dependencies
ARG INSTALL_COMMAND
RUN if [ ! -z "$INSTALL_COMMAND" ]; then $INSTALL_COMMAND; fi

# Optional Copy Stage
ARG COPY_SRC
ARG COPY_DEST
COPY ${COPY_SRC} ${COPY_DEST}

# Default CMD
ARG CMD_COMMAND
CMD ["sh", "-c", "${CMD_COMMAND}"]
