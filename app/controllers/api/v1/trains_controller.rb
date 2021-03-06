# frozen_string_literal: true

module Api
  module V1
    class TrainsController < BaseController
      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:name, :maximum_weight, :maximum_volume, :cost, :status, :user_id,
                      train_lines_attributes: %i[line_id])
      end

      def resources
        @resources ||= Train.available.joins(:train_lines)
      end
    end
  end
end
