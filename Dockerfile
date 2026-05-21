## Multi-stage Dockerfile to build frontend and backend and run the backend serving the built frontend

# --- Build frontend ---
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package.json frontend/package-lock.json ./
COPY frontend/ ./
RUN npm ci && npm run build

# --- Build backend (install deps) ---
FROM node:18-bullseye-slim AS backend-build
WORKDIR /app/backend
COPY backend/package.json backend/package-lock.json ./
COPY backend/ ./
RUN apt-get update && apt-get install -y python3 make g++ && \
    npm ci --production && \
    apt-get purge -y python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

# --- Final image ---
FROM node:18-bullseye-slim
WORKDIR /app

# copy built frontend and backend
COPY --from=frontend-build /app/frontend/dist ./frontend/dist
COPY --from=backend-build /app/backend ./backend

WORKDIR /app/backend
ENV NODE_ENV=production
EXPOSE 5000
CMD ["node", "src/index.js"]
