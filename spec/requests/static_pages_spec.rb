require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do
    it "deberia tener el contenido 'Sample app'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it "deberia tener el título base" do
      visit '/static_pages/home'
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App")
    end

    it "deberia no tener un título de página por defecto" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do
    it "deberia tener el contenido 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "debería tener el título 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do
    it "deberia tener el contenido 'About Us" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "debería tener el título 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end

  describe "Contact page" do
    it "deberia tener el contenido 'Contact" do
      visit '/static_pages/contact'
      page.should have_content('Contact')
    end

    it "debería tener el título 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end

end
