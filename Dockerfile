## Multi-stage Dockerfile to build frontend and backend and run the backend serving the built frontend

# --- Build frontend ---
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package.json frontend/package-lock.json ./
COPY frontend/ ./
RUN npm ci && npm run build

# --- Build backend (install deps) ---
FROM node:18-alpine AS backend-build
WORKDIR /app/backend
COPY backend/package.json backend/package-lock.json ./
COPY backend/ ./
RUN npm ci --production

# --- Final image ---
FROM node:18-alpine
WORKDIR /app

# copy built frontend and backend
COPY --from=frontend-build /app/frontend/dist ./frontend/dist
COPY --from=backend-build /app/backend ./backend

WORKDIR /app/backend
ENV NODE_ENV=production
EXPOSE 5000
CMD ["node", "src/index.js"]
