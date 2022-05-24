class TrainBid < ApplicationRecord
  STATUSES_MAP = {
    in_progress: 'in_progress',
    withdrawen: 'withdrawen',
    accepted: 'accepted'
  }.freeze

  STATUSES = STATUSES_MAP.values

  belongs_to :user, class_name: 'Operator'
  belongs_to :train

  validates :status, inclusion: { in: STATUSES }
end
