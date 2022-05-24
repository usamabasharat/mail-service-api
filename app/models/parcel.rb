class Parcel < ApplicationRecord
  belongs_to :user, class_name: 'ParcelOwner'

  has_one :train_parcel, dependent: :destroy
  has_one :train, through: :train_parcel

  validates :weight, :volume, :shipping_address, presence: true
  validates :weight, :volume, numericality: { greater_than: 0 }
end
