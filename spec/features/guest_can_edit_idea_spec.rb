require 'spec_helper'

describe "Guest edits an idea", :type => :feature, :js => true do
  let(:idea){ Fabricate(:idea) }
  it "edits an idea" do
    visit root_path
    fill_in "idea-title", :with => "Hi Fiona"
    fill_in "idea-body", :with => "I'm at home"
    click_link_or_button "create-idea"
    
    # driver = Selenium::WebDriver.for :firefox
    # element = driver.find_element('idea-title').click
    #try click_on('.idea-title')
    find('.idea-title')
    click_on('Hi Fiona')
    fill_in "idea-title", :with => "Hi Ollie"
    
    within('#latest-ideas') do
      expect(page).to have_content("Hi Ollie")
      expect(page).to_not have_content("Hi Fiona")
      expect(page).to have_content("I'm at home")
    end
  end
end