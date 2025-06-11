# services/schedule_service.rb
require 'date'

class ScheduleService
  def self.create_schedule(params)
    schedule = Schedule.new(
      provider_id: params[:provider_id],
      start_time: DateTime.parse(params[:start_time]),
      end_time: DateTime.parse(params[:end_time]),
      schedule_type: params[:schedule_type],
      recurrence_rule: params[:recurrence_rule],
      recurrence_end_date: params[:recurrence_end_date] ? Date.parse(params[:recurrence_end_date]) : nil
    )
    schedule.save
    schedule
  end

  def self.update_schedule(id, params)
    schedule = Schedule[id]
    return nil unless schedule

    schedule.set_fields(params, [:start_time, :end_time, :schedule_type, :recurrence_rule, :recurrence_end_date])
    schedule.save
    schedule
  end

  def self.delete_schedule(id)
    schedule = Schedule[id]
    schedule&.delete
  end

  def self.all_schedules
    Schedule.all.map(&:to_h)
  end
end