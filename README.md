CoreX – Secure API Dashboard System

A full-stack system focused on **secure backend architecture**, **JWT authentication**, **audit logging**, and **real-time API monitoring**, combined with a modern dashboard UI.

---

 Project Overview

CoreX is designed as a **backend-first system** that provides:

*  Secure authentication using JWT
*  Role-based access control (Admin/User)
*  Real-time API monitoring
*  Audit logging for every request
*  Custom filter chain for security and analytics

---

 Backend Architecture (Spring Boot)

The backend is built using **Spring Boot** with a layered and secure architecture:

```bash
corex/
 ├── controller      # API endpoints
 ├── service         # Business logic
 ├── repository      # Database interaction (JPA)
 ├── security        # JWT + Filters
 ├── config          # Security + CORS config
 ├── entity          # Database models
 └── dto             # Request/Response objects
```

---

 Security System (JWT Based)

CoreX uses **stateless authentication** with JWT tokens.

 Flow:

1. User logs in → receives `accessToken`
2. Token is sent in:

```http
Authorization: Bearer <token>
```

3. Backend validates token via `JwtFilter`
4. Access granted based on role

---

 Custom Security Filters

 JwtFilter

* Validates JWT token
* Extracts user details
* Sets authentication in Spring Security context

 AuditFilter

* Logs every API request
* Stores:

  * Endpoint
  * Method
  * Status
  * Timestamp
* Used for **admin monitoring**

 MetricsFilter

* Tracks API usage
* Counts requests & performance

---

Security Configuration

* CSRF disabled (JWT-based)
* Stateless session (no server session)
* Custom filter chain:

```java
JwtFilter → MetricsFilter → AuditFilter
```

Role-Based Access:

| Endpoint  | Access     |
| --------- | ---------- |
| /auth/**  | Public     |
| /admin/** | ADMIN only |
| /user/**  | USER/ADMIN |

---

 API Endpoints

 Authentication

| API                | Method | Description       |
| ------------------ | ------ | ----------------- |
| /auth/register     | POST   | Register user     |
| /auth/create-admin | POST   | Create admin      |
| /auth/login        | POST   | Login & get token |
| /auth/refresh      | POST   | Refresh token     |
| /auth/logout       | POST   | Logout            |

---

 Admin APIs

| API            | Method | Description         |
| -------------- | ------ | ------------------- |
| /admin/audit   | GET    | View audit logs     |
| /admin/metrics | GET    | View API metrics    |
| /admin/test    | GET    | Admin test endpoint |

---

 User APIs

| API        | Method | Description        |
| ---------- | ------ | ------------------ |
| /user/test | GET    | User test endpoint |

---

 Audit Logs (Core Feature)

Every API request is captured and stored.

 Stored Fields:

* Request ID
* Endpoint
* HTTP Method
* Status Code
* Timestamp

Displayed in UI as a **table dashboard** for admins.

---

 Database

* MySQL (via Spring Data JPA)
* Tables include:

  * users
  * audit_logs
  * (optional) metrics

SQL scripts available in:

```bash
scheme/
```

---

 Setup Instructions

🔹 Backend

```bash
cd corex
mvn spring-boot:run
```

Runs on:

```bash
http://localhost:8080
```

---

🔹 Frontend

```bash
cd corex-ui
npm install
npm run dev
```

Runs on:

```bash
http://localhost:5173
```

---

 Default Credentials

```bash
Email: admin@corex.com
Password: admin123
```

---

 Key Highlights (For Evaluation)

*  Custom JWT Security (No default Spring login)
*  Multiple custom filters (Audit + Metrics)
*  Role-based authorization
*  Stateless backend design
*  Clean layered architecture
*  Real-time API dashboard UI

---

 Future Enhancements

* API rate limiting
* Graph-based analytics dashboard
* Refresh token rotation
* Docker deployment

---
Add this to your app.jsx and repectives 

const API_TREE = {
  Auth: [
    {
      name: "Register",
      method: "POST",
      url: "/auth/register",
      body: true,
      sampleBody: `{
  "username": "user",
  "email": "user@gmail.com",
  "password": "1234",
  "role": "USER"
}`
    },
    {
      name: "Create Admin",
      method: "POST",
      url: "/auth/create-admin",
      body: true,
      sampleBody: `{
  "username": "admin",
  "email": "admin@corex.com",
  "password": "admin123"
}`
    },
    {
      name: "Login",
      method: "POST",
      url: "/auth/login",
      body: true,
      sampleBody: `{
  "email": "admin@corex.com",
  "password": "admin123"
}`
    },
    {
      name: "Refresh Token",
      method: "POST",
      url: "/auth/refresh",
      body: true,
      authRequired: false,
      sampleBody: `{
  "refreshToken": "PASTE_REFRESH_TOKEN"
}`
    },
    {
      name: "Logout",
      method: "POST",
      url: "/auth/logout",
      authRequired: true
    }
  ],

  Admin: [
    { name: "Audit Logs", method: "GET", url: "/admin/audit", authRequired: true },
    { name: "Metrics", method: "GET", url: "/admin/metrics", authRequired: true },
    { name: "Admin Test", method: "GET", url: "/admin/test", authRequired: true }
  ],

  User: [
    { name: "User Test", method: "GET", url: "/user/test", authRequired: true }
  ]
};

Inside your callApi():

// Refresh token handling
if (selectedApi.url === "/auth/refresh" && res.ok && data.accessToken) {
  localStorage.setItem("token", data.accessToken);
  setToken(data.accessToken);
}

Fix logout handling
if (selectedApi.url === "/auth/logout" && res.ok) {
  localStorage.removeItem("token");
  setToken(null);
}

Add badges:

{api.name}
{api.url === "/auth/refresh" && <span className="auth-badge">♻️</span>}
{api.url === "/auth/logout" && <span className="auth-badge">🚪</span>}

Add disable logic (important UX)
<button
  className="send"
  onClick={callApi}
  disabled={loading || (selectedApi.authRequired && !token)}
>
 Author

Chandru
