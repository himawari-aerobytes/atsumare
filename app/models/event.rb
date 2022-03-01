class Event < ApplicationRecord
  has_many :users, through: :appointments
end
