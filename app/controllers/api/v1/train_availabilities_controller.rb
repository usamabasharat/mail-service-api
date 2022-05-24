# frozen_string_literal: true

module Api
  module V1
    class TrainAvailabilitiesController < BaseController
      include ExceptionHandler

      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:from, :to, :train_id, :departure_time, :arrival_time)
      end
    end
  end
end
