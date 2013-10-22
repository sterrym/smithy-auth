require 'spec_helper'

describe "routes to the user sessions controller" do
  routes { Smithy::Engine.routes }

  it "routes login to user_sessions#new" do
    expect(:get => "smithy/login").to route_to( :controller => "smithy/user_sessions", :action => "new" )
  end

  it "routes logout to user_sessions#destroy" do
    expect(:delete => "smithy/logout").to route_to( :controller => "smithy/user_sessions", :action => "destroy" )
  end

  it "routes a :get => logout to pages" do
    expect(:get => "smithy/logout").to route_to( :controller => "smithy/pages", :action => "show", :path => "smithy/logout" )
  end
end
