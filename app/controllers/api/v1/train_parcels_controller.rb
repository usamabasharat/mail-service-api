# frozen_string_literal: true

module Api
  module V1
    class TrainParcelsController < BaseController
      include ExceptionHandler

      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:status, :train_id, :parcel_id)
      end
    end
  end
end
