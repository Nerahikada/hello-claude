FROM debian:13-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	   curl ca-certificates bash \
	&& rm -rf /var/lib/apt/lists/*

# Install Claude Code using the official installer and move to a shared path
RUN curl -fsSL https://claude.ai/install.sh | bash \
	&& mv /root/.local/bin/claude /usr/local/bin/claude

# Run a simple hello command by default
CMD ["claude", "--print", "--no-session-persistence", "hello"]
