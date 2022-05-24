class DeleteTrainJob
  include Sidekiq::Job

  def perform(train_id)
    Train.find(train_id).destroy!
  end
end
