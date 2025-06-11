# services/schedule_service.rb
class ScheduleService
  def self.create_schedule(params)
    Schedule.create(
      practitioner_id: params['practitioner_id'],
      start_time: params['start_time'],
      end_time: params['end_time'],
      schedule_type: params['schedule_type'],
      recurrence_rule: params['recurrence_rule'],
      recurrence_end_date: params['recurrence_end_date']
    )
  end
end