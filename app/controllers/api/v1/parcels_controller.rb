# frozen_string_literal: true

module Api
  module V1
    class ParcelsController < BaseController
      include ExceptionHandler

      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:weight, :volume, :shipping_address, :user_id)
      end
    end
  end
end
