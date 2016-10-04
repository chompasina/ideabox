require 'rails_helper'

RSpec.feature "Guest can see landing page" do
  scenario "they visit the home page" do
    
    visit root_url
    
    expect(page).to have_field("Idea")
    expect(page).to have_field("Description")
    # expect(page).to have_field("Quality")
  end
  
end