export const fetchSchedules = async (practitionerId) => {
  const baseUrl = "http://localhost:4567/schedules";
  const url = practitionerId ? `${baseUrl}/${practitionerId}` : baseUrl;
  const response = await fetch(url);
  if (!response.ok) throw new Error("Failed to fetch schedules");
  return response.json();
};