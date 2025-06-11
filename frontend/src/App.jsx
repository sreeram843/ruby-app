import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import HomePage from "./pages/HomePage";
import SchedulesPage from "./pages/SchedulesPage";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/schedules" element={<SchedulesPage />} />
      </Routes>
    </Router>
  );
}

export default App;