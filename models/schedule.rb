# models/schedule.rb

class Schedule < ActiveRecord::Base
  self.table_name = 'schedules'

  belongs_to :provider

  validates :practitioner_id, :start_time, :end_time, :schedule_type, presence: true
  validates :schedule_type, inclusion: { in: %w[recurring extra personal holiday administrative] }

  def to_h
    {
      id: id,
      practitioner_id: practitioner_id,
      start_time: start_time,
      end_time: end_time,
      schedule_type: schedule_type,
      recurrence_rule: recurrence_rule,
      recurrence_end_date: recurrence_end_date
    }
  end
end