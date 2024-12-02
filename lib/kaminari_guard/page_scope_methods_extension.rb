# frozen_string_literal: true

module KaminariGuard
  module PageScopeMethodsExtension
    def total_pages
      @total_pages_called = true
      super
    end

    def verify_total_pages_called!
      return unless loaded? && size.positive? && @total_pages_called.nil?

      raise KaminariGuard::Error, "total_pages method is not called!"
    end
  end
end
