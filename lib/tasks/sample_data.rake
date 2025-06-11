# lib/tasks/sample_data.rake
require 'faker'
require './models/practitioner'
require './models/schedule'

namespace :db do
  desc "Seed 10 practitioners and 5 schedules each"
  task :seed_sample_data do
    puts "Seeding 10 practitioners and 50 schedules..."

    10.times do
      practitioner = Practitioner.create!(
        identifier: SecureRandom.uuid,
        active: true,
        family_name: Faker::Name.last_name,
        given_name: Faker::Name.first_name,
        gender: %w[male female other unknown].sample,
        birth_date: Faker::Date.birthday(min_age: 25, max_age: 65),
        telecom: {
          phone: Faker::PhoneNumber.cell_phone,
          email: Faker::Internet.email
        }
      )

      5.times do
        start_time = Faker::Time.forward(days: 14, period: :morning)
        end_time = start_time + [20, 40, 60].sample.minutes

        Schedule.create!(
          practitioner_id: practitioner.id,
          start_time: start_time,
          end_time: end_time,
          schedule_type: %w[recurring extra personal holiday administrative].sample
        )
      end
    end

    puts "✅ Done seeding sample data!"
  end
end