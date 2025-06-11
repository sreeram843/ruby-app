# controllers/schedules_controller.rb
class SchedulesController
  
  def self.index
    Schedule.all.map(&:to_h).to_json
  end

  def create(request)
    data = JSON.parse(request.body.read)
    schedule = ScheduleService.create_schedule(data)
    if schedule
      { status: 'created', schedule: schedule.to_h }
    else
      { error: 'Unable to create schedule' }
    end
  rescue JSON::ParserError
    { error: 'Invalid JSON' }
  end

  def get_by_practitioner(practitioner_id)
    schedules = Schedule.where(practitioner_id: practitioner_id)
    schedules.map(&:to_h)
  end
end