require 'rails_helper'

RSpec.describe Idea, :type => :model do
  it "is valid with valid attributes" do
    expect(Idea.new(title: "best idea", body: "this is my best idea")).to be_valid
  end
  
  it "is valid without a title" do
    idea = Idea.new(title: nil, body: "I don't have a title")
    expect(idea).to_not be_valid
  end
  
  it "is not valid without a body" do
    idea = Idea.new(title: "I am a title", body: nil)
    expect(idea).to_not be_valid
  end
end