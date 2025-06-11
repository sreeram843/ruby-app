import React from "react";
import "./ScheduleTable.css";

const ScheduleTable = ({ schedules }) => {
  if (!schedules || schedules.length === 0) return <p>No schedules available.</p>;

  return (
    <table className="schedule-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Practitioner ID</th>
          <th>Type</th>
          <th>Start</th>
          <th>End</th>
        </tr>
      </thead>
      <tbody>
        {schedules.map((s) => (
          <tr key={s.id}>
            <td>{s.id}</td>
            <td>{s.practitioner_id}</td>
            <td>{s.schedule_type}</td>
            <td>{new Date(s.start_time).toLocaleString()}</td>
            <td>{new Date(s.end_time).toLocaleString()}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default ScheduleTable;