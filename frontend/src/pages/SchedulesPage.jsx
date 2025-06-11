import React, { useState } from "react";
import ScheduleTable from "../components/Table/ScheduleTable";
import Loader from "../components/Loader";
import { fetchSchedules } from "../api/schedules";
import "../App.css";

const SchedulesPage = () => {
  const [schedules, setSchedules] = useState([]);
  const [loading, setLoading] = useState(false);
  const [practitionerId, setPractitionerId] = useState("");

  const handleFetch = async () => {
    setLoading(true);
    try {
      const data = await fetchSchedules(practitionerId.trim());
      setSchedules(data);
    } catch (error) {
      console.error("Error fetching schedules", error);
      setSchedules([]);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="schedules-container">
      <h1>📅 Provider Schedules</h1>

      <div className="input-bar">
        <input
          type="number"
          placeholder="Enter Practitioner ID"
          value={practitionerId}
          onChange={(e) => setPractitionerId(e.target.value)}
        />
        <button onClick={handleFetch}>Fetch</button>
      </div>

      <div className="table-wrapper">
        {loading ? <Loader /> : <ScheduleTable schedules={schedules} />}
      </div>
    </div>
  );
};

export default SchedulesPage;