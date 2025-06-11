# controllers/schedules_controller.rb
require 'json'

class SchedulesController
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)

    case [req.request_method, req.path_info]
    when ['GET', %r{^/schedules/?$}]
      list_schedules
    when ['POST', %r{^/schedules/?$}]
      create_schedule(req)
    else
      not_found
    end
  end

  private

  def list_schedules
    schedules = Schedule.all.map(&:to_h)
    [200, { 'Content-Type' => 'application/json' }, [schedules.to_json]]
  end

  def create_schedule(req)
    data = JSON.parse(req.body.read)
    schedule = ScheduleService.new.create(data)

    if schedule
      [201, { 'Content-Type' => 'application/json' }, [schedule.to_h.to_json]]
    else
      [422, { 'Content-Type' => 'application/json' }, [{ error: 'Invalid schedule' }.to_json]]
    end
  rescue JSON::ParserError
    [400, { 'Content-Type' => 'application/json' }, [{ error: 'Invalid JSON' }.to_json]]
  end

  def not_found
    [404, { 'Content-Type' => 'application/json' }, [{ error: 'Not Found' }.to_json]]
  end
end