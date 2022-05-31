# frozen_string_literal: true

module Api
  module V1
    class TrainBidsController < BaseController
      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:status, :user_id, :train_id)
      end
    end
  end
end
