require 'spec_helper'

describe "routes to the user sessions controller", :type => :routing do
  it "routes a named route" do
    { :get => login_path }.should route_to(:controller => "smithy/user_sessions", :action => "new")
  end

  it "routes /smithy/login to the smithy/user_sessions controller" do
    { :get => "/smithy/login" }.should route_to(:controller => "smithy/user_sessions", :action => "new")
  end
end
