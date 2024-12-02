# frozen_string_literal: true

require "active_support/concern"

module KaminariGuard
  module ActiveRecordExtension
    extend ActiveSupport::Concern

    class_methods do
      def kaminari_guard
        singleton_class.alias_method :kaminari_page, :page

        define_singleton_method :page do |num|
          kaminari_page(num).tap { KaminariGuard::Current.add(_1) }
        end
      end
    end
  end
end
