class EventMember < ApplicationRecord
  belongs_to :member
  belongs_to :event
  belongs_to :status
  has_one :status
end
