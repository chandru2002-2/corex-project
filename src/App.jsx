import { useState } from "react";
import "./index.css";

const BASE_URL = "http://localhost:8080";

const APIs = [
  { name: "Login", group: "Auth" },
  { name: "Register", group: "Auth" },
  { name: "Create Admin", group: "Auth" },
  { name: "Audit Logs", group: "Admin" },
  { name: "Metrics", group: "Admin" },
  { name: "User Test", group: "User" }
];

export default function App() {
  const [activeApi, setActiveApi] = useState("Login");
  const [token, setToken] = useState(localStorage.getItem("token"));

  return (
    <div className="app">
      
      {/* 🔷 TOP NAV */}
      <div className="topbar">
        <h2>⚡ CoreX</h2>

        <div className="api-tabs">
          {APIs.map((api) => (
            <button
              key={api.name}
              className={`tab ${activeApi === api.name ? "active" : ""}`}
              onClick={() => setActiveApi(api.name)}
            >
              {api.name}
            </button>
          ))}
        </div>

        <div className="status">
          {token ? "🟢 Connected" : "🔴 Not Logged"}
        </div>
      </div>

      {/* 🔥 DYNAMIC SCREEN */}
      <div className="screen">

  <div style={{ display: activeApi === "Login" ? "block" : "none" }}>
    <Login setToken={setToken} />
  </div>

  <div style={{ display: activeApi === "Register" ? "block" : "none" }}>
    <Register />
  </div>

  <div style={{ display: activeApi === "Create Admin" ? "block" : "none" }}>
    <CreateAdmin />
  </div>

  <div style={{ display: activeApi === "Audit Logs" ? "block" : "none" }}>
    <AuditLogs token={token} />
  </div>

  <div style={{ display: activeApi === "Metrics" ? "block" : "none" }}>
    <Metrics token={token} />
  </div>

  <div style={{ display: activeApi === "User Test" ? "block" : "none" }}>
    <UserTest token={token} />
  </div>

</div>
    </div>
  );
}

//////////////////////////////////////////////////////
// 🔐 LOGIN SCREEN
//////////////////////////////////////////////////////
function Login({ setToken }) {
  const [body, setBody] = useState(`{
  "email": "admin@corex.com",
  "password": "admin123"
}`);

  const [res, setRes] = useState("");

  const call = async () => {
    const r = await fetch(BASE_URL + "/auth/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body
    });

    const data = await r.json();
    setRes(JSON.stringify(data, null, 2));

    if (data.accessToken) {
      localStorage.setItem("token", data.accessToken);
      setToken(data.accessToken);
    }
  };

  return (
    <div className="card">
      <h3>Login</h3>
      <textarea value={body} onChange={(e) => setBody(e.target.value)} />
      <button onClick={call}>Login 🚀</button>
      <pre>{res}</pre>
    </div>
  );
}

//////////////////////////////////////////////////////
// 📝 REGISTER
//////////////////////////////////////////////////////
function Register() {
  const [body, setBody] = useState(`{
  "username": "user",
  "email": "user@gmail.com",
  "password": "1234",
  "role": "USER"
}`);

  const [res, setRes] = useState("");

  const call = async () => {
    const r = await fetch(BASE_URL + "/auth/register", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body
    });

    setRes(await r.text());
  };

  return (
    <div className="card">
      <h3>Register</h3>
      <textarea value={body} onChange={(e) => setBody(e.target.value)} />
      <button onClick={call}>Register</button>
      <pre>{res}</pre>
    </div>
  );
}

//////////////////////////////////////////////////////
// 👑 CREATE ADMIN
//////////////////////////////////////////////////////
function CreateAdmin() {
  const [body, setBody] = useState(`{
  "username": "admin",
  "email": "admin@corex.com",
  "password": "admin123"
}`);

  const [res, setRes] = useState("");

  const call = async () => {
    const r = await fetch(BASE_URL + "/auth/create-admin", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body
    });

    setRes(await r.text());
  };

  return (
    <div className="card">
      <h3>Create Admin</h3>
      <textarea value={body} onChange={(e) => setBody(e.target.value)} />
      <button onClick={call}>Create 👑</button>
      <pre>{res}</pre>
    </div>
  );
}

//////////////////////////////////////////////////////
// 📊 AUDIT LOGS TABLE
//////////////////////////////////////////////////////
function AuditLogs({ token }) {
  const [logs, setLogs] = useState([]);

  const load = async () => {
    const r = await fetch(BASE_URL + "/admin/audit", {
      headers: { Authorization: `Bearer ${token}` }
    });

    const data = await r.json();
    setLogs(data);
  };

  return (
    <div className="card">
      <h3>Audit Logs</h3>
      <button onClick={load}>Load Logs</button>

      <table className="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Endpoint</th>
            <th>Method</th>
            <th>Status</th>
            <th>Time</th>
          </tr>
        </thead>

        <tbody>
          {logs.map((l) => (
            <tr key={l.id}>
              <td>{l.id}</td>
              <td>{l.endpoint}</td>
              <td>
                <span className={`pill ${l.method}`}>{l.method}</span>
              </td>
              <td>
                <span className={`status ${l.status}`}>
                  {l.status}
                </span>
              </td>
              <td>{l.timestamp}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

//////////////////////////////////////////////////////
// 📈 METRICS
//////////////////////////////////////////////////////
function Metrics({ token }) {
  const [data, setData] = useState("");

  const load = async () => {
    const r = await fetch(BASE_URL + "/admin/metrics", {
      headers: { Authorization: `Bearer ${token}` }
    });

    setData(await r.text());
  };

  return (
    <div className="card">
      <h3>Metrics</h3>
      <button onClick={load}>Load</button>
      <pre>{data}</pre>
    </div>
  );
}

//////////////////////////////////////////////////////
// 👤 USER TEST
//////////////////////////////////////////////////////
function UserTest({ token }) {
  const [res, setRes] = useState("");

  const call = async () => {
    const r = await fetch(BASE_URL + "/user/test", {
      headers: { Authorization: `Bearer ${token}` }
    });

    setRes(await r.text());
  };

  return (
    <div className="card">
      <h3>User API</h3>
      <button onClick={call}>Call API</button>
      <pre>{res}</pre>
    </div>
  );
}