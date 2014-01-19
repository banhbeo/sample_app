require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home Page" do

    before { visit root_path }

    it { should have_content('Sample App') }

    it { should_not have_title("Ruby on Rails Tutorial Sample App | Home") }
  end

  describe "Help Page" do
    before { visit help_path }

    it { should have_content('Help') }
    
    it { should have_title('Ruby on Rails Tutorial Sample App | Help') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }

    it { should have_title('Ruby on Rails Tutorial Sample App | About') }
  end

  describe 'Contact page' do
    before { visit contact_path }

    it { should have_content('Contact') }

    it { should have_title('Ruby on Rails Tutorial Sample App | Contact') }
  end
end