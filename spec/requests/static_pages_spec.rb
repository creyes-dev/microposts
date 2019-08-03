require 'spec_helper'

describe "Static Pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click link "Help"
    page.should have_selector 'help', text: full_title('Help')
    click link "Contact"
    page.should have_selector 'contact', text: full_title('Contact')
    click link "Home"
    click link "Sign up now!"
    page.should have_selector 'sign up', text: full_title('Sign up')
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    # it { should have_selector('title', text: full_title('')) }
    # it { should have_selector('h1', text: 'Sample App') }
  end
  describe "Help page" do
    before { visit help_path }
    it { should have_content('Help') }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
    # it { should have_selector('title', text: full_title('Help')) }
    # it { should have_selector('h1', text: 'Help') }
  end
  describe "About page" do
    before { visit about_path }
    it { should have_content('About Us') }
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
    # it { should have_selector('title', text: full_title('About Us')) }
    # it { should have_selector('h1', text: 'About Us') }
  end
  describe "Contact page" do
    before { visit contact_path }
    it { should have_content('Contact') }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
    # it { should have_selector('title', text: full_title('Contact')) }
    # it { should have_selector('h1', text: 'Contact') }
  end
end
