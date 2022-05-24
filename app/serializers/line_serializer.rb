# frozen_string_literal: true

class LineSerializer < ActiveModel::Serializer
  attributes :to, :from, :status
end
