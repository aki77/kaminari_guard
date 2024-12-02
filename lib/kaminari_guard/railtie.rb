# frozen_string_literal: true

require "rails/railtie"
require_relative "controller_extension"
require_relative "active_record_extension"
require_relative "page_scope_methods_extension"
require_relative "current"

module KaminariGuard
  class Railtie < Rails::Railtie
    initializer :kaminari_guard do
      ActiveSupport.on_load(:action_controller) do
        include KaminariGuard::ControllerExtension
      end

      ActiveSupport.on_load(:active_record) do
        include KaminariGuard::ActiveRecordExtension
      end
    end

    initializer :kaminari_guard_page_scope_methods, after: :load_config_initializers do
      Kaminari::PageScopeMethods.prepend KaminariGuard::PageScopeMethodsExtension
    end
  end
end
