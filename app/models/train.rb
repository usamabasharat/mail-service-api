class Train < ApplicationRecord
  STATUSES_MAP = {
    not_booked: 'not_booked',
    booked: 'booked',
    departed: 'departed',
    reached: 'reached'
  }.freeze

  STATUSES = STATUSES_MAP.values

  belongs_to :user, class_name: 'Operator'
  has_one :train_availability, dependent: :destroy
  has_many :train_lines, dependent: :destroy
  has_many :lines, through: :train_lines, dependent: :destroy
  has_many :train_parcels, dependent: :destroy
  has_many :parcels, through: :train_parcels
  has_many :train_bids, dependent: :destroy

  validates :status, inclusion: { in: STATUSES }
  validates :maximum_weight, :maximum_volume, :cost, presence: true
  validates :maximum_weight, :maximum_volume, :cost, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :train_lines

  delegate :departure_time, to: :train_availability, allow_nil: true, prefix: false

  after_update_commit :depart_train!, :assign_line!

  scope :available, -> { where(status: STATUSES_MAP[:not_booked]) }

  private

  # Acceptance Criteria: As soon as it's booked, it departs
  def depart_train!
    return unless saved_change_to_attribute?(:status) && status == STATUSES_MAP[:booked]

    update!(status: STATUSES_MAP[:departed])
  end

  def available_line
    lines.find_by(status: Line::STATUSES_MAP[:available])
  end

  def assign_line!
    return unless saved_change_to_attribute?(:status) && status == STATUSES_MAP[:departed]

    train_lines.find_by(line: available_line).update!(status: TrainLine::STATUSES_MAP[:assigned])
  end
end
