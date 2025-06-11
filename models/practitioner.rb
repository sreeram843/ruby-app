class Practitioner < ActiveRecord::Base
  has_many :schedules

  validates :given_name, :family_name, presence: true
  attribute :telecom, :json

  # Aliases for clarity or Rails compatibility
  def first_name
    given_name
  end

  def last_name
    family_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end