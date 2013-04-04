module Smithy
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Smithy
      engine_name 'smithy_auth' # the underscore allows proper naming for migrations with `rake smithy_auth:install:migrations`

      def self.activate
        ApplicationController.send :include, Smithy::AuthenticationHelpers
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
