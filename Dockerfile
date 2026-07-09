FROM node:22-alpine

WORKDIR /app

# Enable pnpm
RUN corepack enable pnpm

# Install the dependencies locally in the container instead of globally
RUN pnpm add mcp-proxy @mongodb-js/mongodb-mcp-server

# Default port for cloud deployment
ENV PORT=8080
EXPOSE 8080

# Run the local binaries using pnpm exec
CMD pnpm exec mcp-proxy --port $PORT --apiKey $MCP_API_KEY -- pnpm exec mongodb-mcp-server
