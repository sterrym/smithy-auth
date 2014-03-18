require 'spec_helper'

describe Smithy::User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }
  it { should validate_presence_of(:password_digest) }

  its(:smithy_admin?) { should be_true }
end
