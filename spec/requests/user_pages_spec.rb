require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }
    it { should have_selector('h1', text: 'Sign up')}
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  # No funciona:
  # NoMethodError: private method `initialize_dup' called for
  # /gems/activemodel-3.2.3/lib/active_model/attribute_methods.rb:404:in `method_missing'
  
  # describe "profile page" do
  #  # Code to make a user variable
  #  let(:user) { FactoryGirl.create(:user) }
  #  before { visit user_path(user) }
  #  it { should have_selector('h1', text: user.name) }
  #  it { should have_selector('title', text: user.name) }
  #end

end
