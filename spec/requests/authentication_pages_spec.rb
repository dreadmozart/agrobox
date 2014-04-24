require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { page.has_content?('h1', text: 'Sign in') }
    it { page.has_title?('Sign in') }
  end

  describe "signin" do

    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { page.has_title?('Sign in') }
      it { page.has_selector?('div.alert.alert-error') }

    describe "after visiting another page" do
        before { click_link "Home" }
        it { page.has_no_selector?('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      	let(:user) { FactoryGirl.create(:user) }
      	before do
        	fill_in "Email",    with: user.email.upcase
        	fill_in "Password", with: user.password
        	click_button "Sign in"
      	end

      	it { page.has_title?(user.name) }
      	it { page.has_link?('Profile',     		href: user_path(user)) }
      	it { page.has_link?('Sign out',    		href: signout_path) }
      	it { page.has_no_link?('Sign in', href: signin_path) }
    
		describe "followed by signout" do
        	before { click_link "Sign out" }
        	it { should have_link('Sign in') }
      	end
  	end
  end
end