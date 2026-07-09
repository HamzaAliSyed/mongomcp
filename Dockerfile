FROM node:22-alpine

WORKDIR /app

RUN corepack enable pnpm

RUN pnpm add mcp-proxy mongodb-mcp-server --ignore-scripts

ENV PORT=8080
EXPOSE 8080

CMD pnpm exec mcp-proxy --port $PORT --apiKey $MCP_API_KEY -- pnpm exec mongodb-mcp-server --readOnly --connectionString $MDB_MCP_CONNECTION_STRING
