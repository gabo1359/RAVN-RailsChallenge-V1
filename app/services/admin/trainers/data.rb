module Admin
  module Trainers
    class Data < BaseService
      def initialize(params)
        @search = params[:search]
      end

      def call
        data
        search_by_name
      end

      private

      attr_reader :search

      def data
        @trainers = Users::Trainer.order("LOWER(first_name)")
      end

      def search_by_name
        @trainers.where("CONCAT(first_name, ' ', last_name) LIKE :search OR email LIKE :search", search: "%#{search}%")
      end
    end
  end
end
