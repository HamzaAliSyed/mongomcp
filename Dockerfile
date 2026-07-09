FROM node:22-alpine

WORKDIR /app

# Enable pnpm
RUN corepack enable pnpm

# Install proxy and the newly renamed server, bypassing optional C++ build scripts
RUN pnpm add mcp-proxy mongodb-mcp-server --ignore-scripts

# Default port for cloud deployment
ENV PORT=8080
EXPOSE 8080

# Run the local binaries using pnpm exec
CMD pnpm exec mcp-proxy --port $PORT --apiKey $MCP_API_KEY -- pnpm exec mongodb-mcp-server --readOnly
