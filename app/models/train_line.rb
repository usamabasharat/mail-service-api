class TrainLine < ApplicationRecord
  STATUSES_MAP = {
    assigned: 'assigned',
    unassigned: 'unassigned'
  }.freeze

  STATUSES = STATUSES_MAP.values

  belongs_to :train
  belongs_to :line

  validates :status, inclusion: { in: STATUSES }
  validate :line_unavailable
  validate :single_assignment, on: :update

  after_update_commit :create_availability!

  private

  def line_unavailable
    return unless line.status == Line::STATUSES_MAP[:unavailable]

    errors.add(:base, 'Line is unavailable')
  end

  def single_assignment
    assigned_lanes = TrainLine.where(train: train, status: STATUSES_MAP[:assigned])

    return if assigned_lanes.length < 2

    errors.add(:base, "Train already assigned to: Lane ##{assigned_lanes.pluck(:id)}")
  end

  def create_availability!
    TrainAvailability.create!(from: line.from, to: line.to, departure_time: Time.current,
                              arrival_time: 3.hours.from_now, train: train)

    UpdateParcelStatusToDeliveredJob.perform_at(3.hours.from_now, train.train_parcels.pluck(:id))
  end
end
