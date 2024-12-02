# frozen_string_literal: true

require "active_support/concern"

module KaminariGuard
  module ControllerExtension
    extend ActiveSupport::Concern

    class_methods do
      def kaminari_guard
        after_action lambda {
          KaminariGuard::Current.scopes.each(&:verify_total_pages_called!)
        }
      end
    end
  end
end
