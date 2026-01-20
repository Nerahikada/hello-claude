FROM debian:13-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	   curl ca-certificates bash \
	&& rm -rf /var/lib/apt/lists/*

# Install Claude Code using the official installer
RUN curl -fsSL https://claude.ai/install.sh | bash

# Ensure the installer-installed binaries in root's local bin are on PATH
ENV PATH=/root/.local/bin:${PATH}

# Run a simple hello command by default
CMD ["claude", "--print", "--no-session-persistence", "hello"]
