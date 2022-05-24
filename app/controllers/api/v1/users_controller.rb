# frozen_string_literal: true

module Api
  module V1
    class UsersController < BaseController
      include ExceptionHandler

      actions :create, :index, :show, :update, :destroy

      private

      def permitted_params
        params.permit(:id, :type)
      end
    end
  end
end
