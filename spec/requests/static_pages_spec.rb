require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "deberia tener el contenido 'Sample app'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end
end
