require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home Page" do

    before { visit root_path }

    it { should have_content('Sample App') }

    it { should_not have_title("Ruby on Rails Tutorial Sample App | Home") }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
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