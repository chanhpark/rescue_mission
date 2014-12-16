require 'rails_helper'

feature "user views all posts", %q{
  As a user
  I want to view recently posted questions
  So that I can help others

  Acceptance Criteria

  - I must see the title of each question
  - I must see questions listed in order, most recently posted first
} do
    it "view all posts" do

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

    end
  end
