require 'rails_helper'

feature "User can be able to delete a post", %q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions

  Acceptance Criteria

  - I must be able delete a question from the question edit page
  - I must be able delete a question from the question details page
  - All answers associated with the question must also be deleted } do

    it "Delete a post from the details page" do

      visit '/posts/new'
      fill_in "Title", with: "This is a post with a title more than forty characters, I think............"
      fill_in "Description", with: "This description has to be a minimum of 150 characters
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Submit"

      expect(page).to have_content "You have successfully submitted a post"
      expect(page).to have_content "This is a post with a title more than forty characters, I think............"
      expect(page).to have_content "This description has to be a minimum of 150 characters
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Delete This question"

      expect(page).to have_content "You have successfully deleted this post"

    end


      it "delete a post from the edit page" do
      visit '/posts/new'
      fill_in "Title", with: "This is a post with a title more than forty characters, I think............"
      fill_in "Description", with: "This description has to be a minimum of 150 characters
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Submit"

      expect(page).to have_content "You have successfully submitted a post"
      expect(page).to have_content "This is a post with a title more than forty characters, I think............"
      expect(page).to have_content "This description has to be a minimum of 150 characters
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Edit Question"

      expect(page).to have_content "Editing a Post"

      click_on "Delete this question"

      expect(page).to have_content "Here are a list of questions"
    end

  end
