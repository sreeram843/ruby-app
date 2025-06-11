import React from "react";
import { useNavigate } from "react-router-dom";

const HomePage = () => {
  const navigate = useNavigate();

  return (
    <div style={{ textAlign: "center", padding: "2rem" }}>
      <h1>Welcome to the Scheduling App</h1>
      <button
        style={{
          padding: "0.6rem 1.5rem",
          fontSize: "1rem",
          backgroundColor: "#007BFF",
          color: "white",
          border: "none",
          borderRadius: "6px",
          cursor: "pointer",
        }}
        onClick={() => navigate("/schedules")}
      >
        Go to Schedules Page
      </button>
    </div>
  );
};

export default HomePage;