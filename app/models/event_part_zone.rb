class EventPartZone < ApplicationRecord
  belongs_to :event
  belongs_to :part
  belongs_to :zone
end
