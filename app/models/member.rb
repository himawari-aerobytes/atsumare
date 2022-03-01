class Member < ApplicationRecord
  has_many :events
  has_one :division,:group,:schoolname,:zone
  has_many :events, through: :appointments
end
