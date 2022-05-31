class UpdateParcelStatusToDeliveredJob
  include Sidekiq::Job

  def perform(parcels)
    parcels.update_all(status: TrainParcel::STATUSES_MAP[:delivered])
  end
end
