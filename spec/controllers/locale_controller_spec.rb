require 'spec_helper'

describe LocaleController do
  # it "should use Spree::BaseController" do
  #   controller.should be_an_instance_of(Spree::BaseController)
  # end

  it "should redirect to index with session[:locale] set to :es" do
    session[:locale].should be_nil
    get 'set', :locale => 'es'
    session[:locale].should == :es
    response.should redirect_to(root_path)
  end
  
  it "should redirect to index with session[:locale] set to :en and not :ru" do
    get 'set', :locale => 'ru'
    session[:locale].should_not == :ru
    session[:locale].should == :en
    response.should redirect_to(root_path)
  end
  
  it "should give url for Spanish" do
    { :get => "/es" }.should route_to(:controller => "locale", :action => "set", :locale => "es")
    { :get => "/ru" }.should_not route_to(:controller => "locale", :action => "set", :locale => "es")
  end
end
