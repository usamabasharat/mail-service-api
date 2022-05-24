ActiveRecord::Base.transaction do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, type: 'PostMaster')
  operator = User.create!(name: Faker::Name.name, email: Faker::Internet.email, type: 'Operator')
  parcel_owner = User.create!(name: Faker::Name.name, email: Faker::Internet.email, type: 'ParcelOwner')

  3.times do
    Train.create!(
      name: Faker::Movie.title,
      maximum_weight: Faker::Number.positive(from: 10, to: 20),
      maximum_volume: Faker::Number.positive(from: 10, to: 20),
      cost: Faker::Number.positive(from: 10, to: 20),
      user_id: operator.id
    )
  end

  3.times do
    Parcel.create!(
      shipping_address: Faker::Address.full_address,
      weight: Faker::Number.positive(from: 10, to: 20),
      volume: Faker::Number.positive(from: 10, to: 20),
      user_id: parcel_owner.id
    )
  end

  3.times do
    Line.create!(
      to: Faker::Address.city,
      from: Faker::Address.city
    )
  end

  TrainBid.create!(status: TrainBid::STATUSES_MAP[:in_progress], train: Train.first, user: operator)
  TrainBid.create!(status: TrainBid::STATUSES_MAP[:in_progress], train: Train.second, user: operator)
  TrainLine.create!(train: Train.first, line: Line.first)
  TrainLine.create!(train: Train.second, line: Line.second)
end
