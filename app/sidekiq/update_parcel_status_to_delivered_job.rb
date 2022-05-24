class UpdateParcelStatusToDeliveredJob
  include Sidekiq::Job

  def perform(parcels)
    parcels.each { |parcel_id| TrainParcel.find(parcel_id).update!(status: TrainParcel::STATUSES_MAP[:delivered]) }
  end
end
