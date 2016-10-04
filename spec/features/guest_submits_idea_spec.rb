require 'spec_helper'

describe "Guest submits an idea", :type => :feature, :js => true do
  let(:idea){ Fabricate(:idea) }
  it "creates an idea" do
    visit root_path
    fill_in "idea-title", :with => "Help students"
    fill_in "idea-body", :with => "Within our team"
    click_link_or_button "create-idea"
    within('#latest-ideas') do
      expect(page).to have_content("Help students")
      expect(page).to have_content("Within our team")
    end
  end
end