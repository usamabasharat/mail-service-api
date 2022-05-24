# frozen_string_literal: true

class ParcelSerializer < ActiveModel::Serializer
  attributes :id, :weight, :volume, :shipping_address, :user_id

  attribute :shipping_cost, if: -> { object.train }

  def shipping_cost
    object.train.cost
  end
end
