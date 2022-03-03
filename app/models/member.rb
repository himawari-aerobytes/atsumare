class Member < ApplicationRecord
  has_many :events
  has_one :division
  has_one :group
  has_one :schoolname
  has_one :zone
  has_many :events, through: :appointments
end
