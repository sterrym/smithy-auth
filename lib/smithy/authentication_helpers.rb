module Smithy
  module AuthenticationHelpers
    def self.included(receiver)
      receiver.send :helper_method, :smithy_current_user
      receiver.send :helper_method, :smithy_user
      receiver.send :helper_method, :smithy_login_path
      receiver.send :helper_method, :smithy_signup_path
      receiver.send :helper_method, :smithy_logout_path
    end

    def smithy_current_user
      current_user
    end

    def smithy_user
      current_user
    end

    def smithy_login_path
      smithy.login_path
    end

    def smithy_signup_path
      smithy.signup_path
    end

    def smithy_logout_path
      smithy.logout_path
    end
  end
end
