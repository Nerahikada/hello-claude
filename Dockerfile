FROM debian:13-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	   curl ca-certificates bash \
	&& rm -rf /var/lib/apt/lists/*

# Install Claude Code using the official installer and relocate to a shared path
RUN curl -fsSL https://claude.ai/install.sh | bash \
	&& mv /root/.local/share/claude /usr/local/share/claude \
	&& ln -sf "$(ls /usr/local/share/claude/versions/*)" /usr/local/bin/claude \
	&& rm -f /root/.local/bin/claude

# Run a simple hello command by default
CMD ["claude", "--print", "--no-session-persistence", "hello"]
