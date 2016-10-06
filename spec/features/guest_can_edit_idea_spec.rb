require 'spec_helper'

describe "Guest edits an idea", :type => :feature, :js => true do
  let(:idea){ Fabricate(:idea) }
  it "edits an idea" do
    visit root_path
    fill_in "idea-title", :with => "Help students"
    fill_in "idea-body", :with => "Within our team"
    click_link_or_button "create-idea"
    
    driver = Selenium::WebDriver.for :firefox
    element = driver.find_element('idea-title').click
    
    fill_in "idea-title", :with => "Help teachers"
    
    within('#latest-ideas') do
      expect(page).to have_content("Help teachers")
      expect(page).to_not have_content("Help students")
      expect(page).to have_content("Within our team")
    end
  end
end