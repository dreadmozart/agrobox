require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { page.should have_content('agroBox App') }
    it { page.has_title?(full_title('')) }
    it { page.should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { page.should have_content('Help') } 
    it { page.has_title?(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { page.should have_content('About') }
    it { page.has_title?(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { page.should have_content('Contact') }
    it { page.has_title?(full_title('Contact')) }
  end
end

