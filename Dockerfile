FROM node:22-alpine

WORKDIR /app

# Configure the global bin directory for pnpm and add it to PATH
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

# Enable pnpm
RUN corepack enable pnpm

# Install the secure proxy and official MongoDB MCP server using pnpm
RUN pnpm add -g mcp-proxy @mongodb-js/mongodb-mcp-server

# Default port for cloud deployment
ENV PORT=8080
EXPOSE 8080

# Start the proxy, requiring an API key, and pipe to the MCP server using pnpx
CMD mcp-proxy --port $PORT --apiKey $MCP_API_KEY -- pnpx @mongodb-js/mongodb-mcp-server
