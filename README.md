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

 Author

**Chandru**
