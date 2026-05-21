# 🚀 Team Task Manager (Full-Stack)

A modern full-stack web application where teams can create projects, assign tasks, manage members, and track progress with secure role-based access control.

---

# 📌 Features

## 🔐 Authentication

- User Registration & Login
- JWT Authentication
- Secure Password Hashing using bcrypt
- Protected Routes

## 📁 Project Management

- Create Projects
- Update & Delete Projects
- Add Team Members
- Assign Roles (Admin / Member)

## ✅ Task Management

- Create Tasks
- Assign Tasks to Members
- Update Task Status
- Set Due Dates
- Track Progress

## 📊 Dashboard

- Total Tasks
- Completed Tasks
- Pending Tasks
- Overdue Tasks
- Recent Activities

## 🛡️ Role-Based Access Control (RBAC)

### Admin

- Manage Projects
- Manage Members
- Delete Any Task
- Update Project Details

### Member

- View Assigned Projects
- Create & Update Tasks
- Track Task Progress

---

# 🛠️ Tech Stack

| Layer          | Technology                   |
| -------------- | ---------------------------- |
| Frontend       | React.js, Vite, React Router |
| Backend        | Node.js, Express.js          |
| Database       | SQLite (`node:sqlite`)       |
| Authentication | JWT + bcrypt                 |
| Validation     | express-validator            |

---

# 📂 Project Structure

```bash
project/
├── backend/
│   ├── src/
│   │   ├── middleware/
│   │   ├── routes/
│   │   ├── controllers/
│   │   ├── utils/
│   │   ├── db.js
│   │   └── index.js
│   ├── data/
│   └── package.json
│
└── frontend/
    ├── src/
    │   ├── pages/
    │   ├── components/
    │   ├── layouts/
    │   ├── api.js
    │   └── App.jsx
    └── package.json
```

---

# ⚙️ Installation & Setup

# 1️⃣ Clone Repository

```bash
git clone <repository-url>
cd project
```

---

# 2️⃣ Backend Setup

```bash
cd backend
npm install
npm run seed
npm run dev
```

Backend runs on:

```bash
http://localhost:5000
```

---

# 3️⃣ Frontend Setup

```bash
cd frontend
npm install
npm run dev
```

Frontend runs on:

```bash
http://localhost:5173
```

---

# � Deploy on Render

This repo is prepared for Render using the included `Dockerfile`.

1. Connect your GitHub repo: `anuragrajput23/TaskManagement`.
2. Create a new Web Service and choose:
   - Environment: `Docker`
   - Branch: `main`
   - Dockerfile Path: `Dockerfile`
3. Add environment variables:
   - `PORT=5000`
   - `JWT_SECRET=<your-secret>`
   - `CLIENT_URL=https://<your-render-url>`
4. Optionally add a persistent disk mounted at `/app/backend/data` for SQLite data.
5. Deploy and verify the app URL.

> If Render asks for build/start commands, no extra commands are needed because the Dockerfile handles both build and runtime.

---

# �🔑 Demo Accounts

| Email             | Password    | Role   |
| ----------------- | ----------- | ------ |
| alice@example.com | password123 | Admin  |
| bob@example.com   | password123 | Member |
| carol@example.com | password123 | Member |

---

# 📡 API Endpoints

## Authentication

| Method | Endpoint             | Description      |
| ------ | -------------------- | ---------------- |
| POST   | `/api/auth/register` | Register User    |
| POST   | `/api/auth/login`    | Login User       |
| GET    | `/api/auth/me`       | Get Current User |

---

## Dashboard

| Method | Endpoint         |
| ------ | ---------------- |
| GET    | `/api/dashboard` |

---

## Projects

| Method | Endpoint            |
| ------ | ------------------- |
| GET    | `/api/projects`     |
| POST   | `/api/projects`     |
| GET    | `/api/projects/:id` |
| PUT    | `/api/projects/:id` |
| DELETE | `/api/projects/:id` |

---

## Members

| Method | Endpoint                            |
| ------ | ----------------------------------- |
| GET    | `/api/projects/:id/members`         |
| POST   | `/api/projects/:id/members`         |
| PATCH  | `/api/projects/:id/members/:userId` |
| DELETE | `/api/projects/:id/members/:userId` |

---

## Tasks

| Method | Endpoint                  |
| ------ | ------------------------- |
| GET    | `/api/projects/:id/tasks` |
| POST   | `/api/projects/:id/tasks` |
| PATCH  | `/api/tasks/:taskId`      |
| DELETE | `/api/tasks/:taskId`      |

---

# 🔒 Authentication Header

All protected routes require:

```bash
Authorization: Bearer <token>
```

---

# 🗄️ Database Schema

```bash
users
 ├── projects
 │     └── tasks
 │
 └── project_members
        └── roles (admin/member)
```

---

# 📊 Task Status Flow

```bash
todo → in_progress → done
```

---

# 🌟 Key Highlights

- Full-Stack Application
- RESTful APIs
- JWT Authentication
- Role-Based Access Control
- Responsive UI
- Proper Database Relationships
- Secure Backend Validation
- Clean Folder Structure

---

# 🚀 Deployment

This project is deployed easily using:

- Railway

---

---

# 👨‍💻 Author

Anurag Kumar

---

# 📄 License

This project is developed for educational and assignment purposes.

MIT License
