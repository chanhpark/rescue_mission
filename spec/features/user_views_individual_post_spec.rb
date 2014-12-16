require 'rails_helper'

feature "user can see details of the posts", %q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria

  - I must be able to get to this page from the questions index
  - I must see the question's title
  - I must see the question's description
  } do
    it "details of post" do

      visit '/posts/new'
      fill_in "Title", with: "rspec help"
      fill_in "Description", with: "this is a really complicated problem"
      click_on "Submit"

      visit '/posts/new'
      fill_in "Title", with: "asdfasdf"
      fill_in "Description", with: "lets go eat dinner!"
      click_on "Submit"

      visit '/posts/new'
      fill_in "Title", with: "i need help with arrays"
      fill_in "Description", with: "[123,123123,4123123]"
      click_on "Submit"

      visit '/posts'

      expect(page).to have_content "rspec help"
      expect(page).to have_content "asdfasdf"
      expect(page).to have_content "i need help with arrays"

      click_on "rspec help"

      expect(page).to have_content "rspec help"
      expect(page).to have_content "this is a really complicated problem"

    end
  end
