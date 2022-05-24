class TrainAvailability < ApplicationRecord
  belongs_to :train

  validates :from, :to, :departure_time, :arrival_time, presence: true
  validates :from, exclusion: { in: ->(train_ava) { [train_ava.to] } }
  validate :arrival_after_departure_date

  private

  def arrival_after_departure_date
    return if departure_time.blank? || arrival_time.blank?

    errors.add(:arrival_time, 'must be after the departure time') if arrival_time < departure_time
  end
end
