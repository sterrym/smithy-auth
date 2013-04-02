module Smithy
  class User
    has_secure_password

    def smithy_admin?
      true
    end
  end
end
