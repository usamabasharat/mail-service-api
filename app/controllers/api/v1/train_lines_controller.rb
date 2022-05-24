# frozen_string_literal: true

module Api
  module V1
    class TrainLinesController < BaseController
      include ExceptionHandler

      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:train_id, :line_id)
      end
    end
  end
end
