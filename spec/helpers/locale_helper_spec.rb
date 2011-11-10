require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the LocaleHelper. For example:
#
# describe LocaleHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe LocaleHelper do
  # test locale_name
  it "should return Spanish" do
    locale_name(:es).should == 'Spanish'
  end
  it "should not return Russian" do
    locale_name(:ru).should_not == 'Russian'
  end

  # test link_to_locale
  it "should link to Spanish locale" do
    link_to_locale(:es).should == '<a href="/es">Spanish</a>'
  end
  it "should link to Spanish locale with custom name" do
    link_to_locale(:es, 'Spanish (ES)').should == '<a href="/es">Spanish (ES)</a>'
  end
  it "should not link to Russian locale" do
    link_to_locale(:ru).should_not == '<a href="/ru">translation missing: ru.this_file_language</a>'
  end

  # test current_locale
  it "should return :es" do
    session[:locale] = :es
    current_locale.should == :es
  end
  it "should return not return :en" do
    session[:locale] = :es
    current_locale.should_not == :en
  end

  # test current_locale?
  it "should return true" do
    session[:locale] = :es
    current_locale?(:es).should be_true
  end
  it "should return false" do
    session[:locale] = :es
    current_locale?(:en).should be_false
  end
end
