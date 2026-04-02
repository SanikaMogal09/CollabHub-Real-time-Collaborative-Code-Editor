# 🚀 CollabHub: Real-Time Collaborative Code Editor

## 📖 Project Overview
CollabHub is a scalable, real-time collaborative code editor that enables multiple users to write and edit code simultaneously within a shared environment. It leverages advanced synchronization techniques to ensure seamless collaboration without conflicts, delivering an IDE-like experience directly in the browser.

Designed with modern cloud-native principles, the entire application is containerized and deployed on AWS using a highly available and scalable architecture.

---

## ✨ Key Features

- ⚡ **Real-Time Collaboration**
  - Instantly syncs code changes across all connected users using WebSockets.

- 🔄 **Conflict-Free Editing (CRDT)**
  - Implements Yjs CRDT to merge simultaneous edits without data loss or conflicts.

- 👥 **User Presence & Awareness**
  - Displays active users in real-time with a dynamic sidebar.

- 🧠 **IDE-Like Experience**
  - Powered by Monaco Editor (same engine as VS Code) for syntax highlighting and IntelliSense.

- 📦 **Optimized Deployment**
  - Full-stack app bundled into a single Docker container using multi-stage builds.

---

## 🛠️ Tech Stack

### Frontend
- React (Vite)
- Tailwind CSS
- Monaco Editor (`@monaco-editor/react`)

### Backend & Collaboration
- Node.js + Express.js
- Socket.io (real-time communication)
- Yjs (CRDT engine)
- y-monaco & y-websocket

### DevOps & Cloud
- Docker (multi-stage builds)
- AWS ECR (container registry)
- AWS ECS (Fargate for serverless deployment)
- AWS ALB + VPC (networking & load balancing)

---

## 🏗️ Architecture & Working

### 1. Efficient State Synchronization
Instead of sending entire files on each change, Yjs maintains a shared document (`Y.Doc`) and transmits only incremental updates (deltas), reducing bandwidth usage and improving performance.

### 2. Real-Time Communication
The backend server uses Socket.io as a communication hub:
- Receives updates from one client
- Broadcasts them instantly to all connected clients

### 3. Seamless Frontend-Backend Integration
- Frontend is built using Vite (`npm run build`)
- Static files are served via Express using `express.static`
- Both frontend and backend run on a single port inside the container

---

## 🚀 AWS Deployment Strategy

1. **Docker Image Build**
   - Multi-stage build ensures lightweight and production-ready image
   - Built for `linux/amd64` compatibility

2. **Container Registry (ECR)**
   - Image is pushed to AWS Elastic Container Registry

3. **Container Orchestration (ECS Fargate)**
   - Runs the container without managing servers

4. **Networking & Load Balancing**
   - Hosted inside a VPC
   - Exposed via Application Load Balancer (ALB)
   - Secured using Security Groups

---

## 📌 Future Enhancements

- 🧑‍💻 Multi-room collaboration support
- 💬 Integrated chat system
- 🔐 Authentication & access control
- 📂 File system support (multiple files/projects)
- ⚙️ Code execution support (like online compilers)

---

## 🧠 Key Learnings

- Real-time systems using WebSockets
- CRDT-based conflict resolution
- Full-stack containerization
- AWS cloud deployment (ECR, ECS, ALB, VPC)
- Scalable system design

---

