class Line < ApplicationRecord
  STATUSES_MAP = {
    available: 'available',
    unavailable: 'unavailable'
  }.freeze

  STATUSES = STATUSES_MAP.values

  validates :from, :to, presence: true
  validates :from, exclusion: { in: ->(line) { [line.to] } }
  validates :status, inclusion: { in: STATUSES }
end
