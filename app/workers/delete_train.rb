class DeleteTrain
  include Sidekiq::Worker
  sidekiq_options retry: false

  attr_reader :train_id

  def initialize(train_id)
    @train_id = train_id
  end

  def perform
    Train.find(train_id).destroy!
  end
end
