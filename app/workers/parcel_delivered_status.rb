class ParcelDeliveredStatus
  include Sidekiq::Worker
  sidekiq_options retry: false

  attr_reader :parcels

  def initialize(parcels)
    @parcels = parcels
  end

  def perform
    parcels.each { |parcel| parcel.update!(status: STATUSES_MAP[:in_progress]) }
  end
end
