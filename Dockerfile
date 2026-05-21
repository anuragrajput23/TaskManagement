## Multi-stage Dockerfile to build frontend and backend and run the backend serving the built frontend

# --- Build frontend ---
FROM node:22-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package.json frontend/package-lock.json ./
COPY frontend/ ./
RUN npm ci && npm run build

# --- Build backend (install deps) ---
FROM node:22-bullseye-slim AS backend-build
WORKDIR /app
COPY package.json package-lock.json ./
COPY backend/package.json ./backend/package.json
RUN apt-get update && apt-get install -y python3 make g++ && \
    npm ci --omit=dev --workspace backend && \
    apt-get purge -y python3 make g++ && \
    rm -rf /var/lib/apt/lists/*
COPY backend/ ./backend

# --- Final image ---
FROM node:22-bullseye-slim
WORKDIR /app

# copy built frontend and backend
COPY --from=frontend-build /app/frontend/dist ./frontend/dist
COPY --from=backend-build /app/node_modules ./node_modules
COPY --from=backend-build /app/backend ./backend

WORKDIR /app/backend
ENV NODE_ENV=production
EXPOSE 5000
CMD ["sh", "-c", "node src/seed.js && node src/index.js"]
