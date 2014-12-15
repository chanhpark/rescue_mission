require 'rails_helper'

feature "user creates a post", %q{
As a user
I want to post a question
So that I can receive help from others } do
  # Acceptance Criteria
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
#   # - I must be presented with errors if I fill out the form incorrectly
# context "visit page" do
  it "creates a post with valid attributes" do

    visit '/posts'

    visit '/posts/new'
    fill_in "Title", with: "rspec help"
    fill_in "Description", with: "this is a really complicated problem"
    click_on "Submit"

    expect(page).to have_content "you have successfully submitted a post"
    expect(page).to have_content "rspec help"
    expect(page).to have_content "this is a really complicated problem"

  end
end
