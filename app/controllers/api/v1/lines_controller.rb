# frozen_string_literal: true

module Api
  module V1
    class LinesController < BaseController
      include ExceptionHandler

      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:to, :from, :status, :train_id)
      end
    end
  end
end
