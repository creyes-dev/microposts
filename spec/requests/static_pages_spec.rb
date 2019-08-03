require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do
    before { visit root_path }

    it "deberia tener el contenido 'Sample app'" do
      page.should have_content('Sample App')
    end

    it "deberia tener el título base" do
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App")
    end

    it "deberia no tener un título de página por defecto" do
      page.should_not have_selector('title', :text => '| Home')
    end

    it "Debería tener el h1 'Sample App'" do
      page.should have_selector('h1', text: 'Sample App')
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "deberia tener el contenido 'Help'" do
      page.should have_content('Help')
    end

    it "debería tener el título 'Help'" do
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | Help")
    end

    it "debería tener el h1 'Help'" do
      page.should have_selector('h1', text: 'Help')
    end
  end

  describe "About page" do
    before { visit about_path }

    it "deberia tener el contenido 'About Us" do
      page.should have_content('About Us')
    end

    it "debería tener el título 'About Us'" do
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | About Us")
    end

    it "debería tener el h1 'About'" do
      page.should have_selector('h1', text: 'About Us')
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    it "deberia tener el contenido 'Contact" do
      page.should have_content('Contact')
    end

    it "debería tener el título 'Contact'" do
      page.should have_selector('title',
      :text => "Ruby on Rails Tutorial Sample App | Contact")
    end

    it "Debería tener el h1 'Contact'" do
      page.should have_selector('h1', text: 'Contact')
    end

    it "Deberia tener el título 'Contact'" do
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
