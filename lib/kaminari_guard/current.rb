# frozen_string_literal: true

require "active_support"

module KaminariGuard
  class Current < ActiveSupport::CurrentAttributes
    attribute :scopes, default: -> { [] }

    def add(scope)
      scopes << scope
    end
  end
end
