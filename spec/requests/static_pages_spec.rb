require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title('Hackathon Blog') }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title('Hackathon Blog | Help') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title('Hackathon Blog | About Us') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title('Hackathon Blog | Contact') }
  end
end
