require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do
    it "deberia tener el contenido 'Sample app'" do
      visit root_path
      page.should have_content('Sample App')
    end

    it "deberia tener el título base" do
      visit root_path
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App")
    end

    it "deberia no tener un título de página por defecto" do
      visit root_path
      page.should_not have_selector('title', :text => '| Home')
    end

    it "Debería tener el h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', text: 'Sample App')
    end
  end

  describe "Help page" do
    it "deberia tener el contenido 'Help'" do
      visit help_path
      page.should have_content('Help')
    end

    it "debería tener el título 'Help'" do
      visit help_path
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | Help")
    end

    it "debería tener el h1 'Help'" do
      visit help_path
      page.should have_selector('h1', text: 'Help')
    end
  end

  describe "About page" do
    it "deberia tener el contenido 'About Us" do
      visit about_path
      page.should have_content('About Us')
    end

    it "debería tener el título 'About Us'" do
      visit about_path
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | About Us")
    end

    it "debería tener el h1 'About'" do
      visit about_path
      page.should have_selector('h1', text: 'About Us')
    end
  end

  describe "Contact page" do
    it "deberia tener el contenido 'Contact" do
      visit contact_path
      page.should have_content('Contact')
    end

    it "debería tener el título 'Contact'" do
      visit contact_path
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | Contact")
    end

    it "Debería tener el h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "Deberia tener el título 'Contact'" do
      visit contact_path
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
