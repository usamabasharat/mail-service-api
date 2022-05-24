# frozen_string_literal: true

class TrainSerializer < ActiveModel::Serializer
  attributes :id, :name, :maximum_volume, :maximum_weight, :cost, :status, :user_id, :current_capacity

  attribute :assigned_line, if: -> { object.status == Train::STATUSES_MAP[:departed] }
  attribute :departure_time, if: -> { object.status == Train::STATUSES_MAP[:departed] }

  has_many :parcels, serializer: ParcelSerializer, if: -> { object.status == Train::STATUSES_MAP[:departed] }
  has_many :lines, serializer: LineSerializer

  def current_capacity
    object.maximum_weight - object.parcels.pluck(:weight).sum
  end

  def assigned_line
    object.train_lines.find_by(status: TrainLine::STATUSES_MAP[:assgined])
  end
end
