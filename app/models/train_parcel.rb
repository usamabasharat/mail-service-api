class TrainParcel < ApplicationRecord
  STATUSES_MAP = {
    accepted: 'accepted',
    in_progress: 'in_progress',
    delivered: 'delivered'
  }.freeze

  STATUSES = STATUSES_MAP.values

  belongs_to :train
  belongs_to :parcel

  validates :status, inclusion: { in: STATUSES }
end
