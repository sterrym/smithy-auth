module Smithy
  class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation

    validates_presence_of :email
    validates_presence_of :password, :on => :create

    has_secure_password

    def smithy_admin?
      true
    end
  end
end
