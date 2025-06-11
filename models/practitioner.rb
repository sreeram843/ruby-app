class Practitioner < ActiveRecord::Base
  has_many :schedules

  validates :first_name, :last_name, presence: true
  attribute :telecom, :json

  def first_name
    given_name
  end

  def last_name
    family_name
  end
end