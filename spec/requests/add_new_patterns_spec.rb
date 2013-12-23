require 'spec_helper'

describe "AddNewPatterns" do
  it "shows the new pattern after adding it" do
    visit new_pattern_path
    fill_in 'Title', :with => 'A new title'
    fill_in 'Pattern', :with => 'Some Pattern'
    click_button 'Save'
    current_path.should match /\/patterns\/\d+/
  end
end