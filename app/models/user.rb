class User < ApplicationRecord
  validates :type, :name, :email, presence: true
end
