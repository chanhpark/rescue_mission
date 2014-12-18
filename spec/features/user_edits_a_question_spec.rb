require 'rails_helper'

feature "User creates a post", %q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates

  Acceptance Criteria

  - I must provide valid information
  - I must be presented with errors if I fill out the form incorrectly
  - I must be able to get to the edit page from the question details page
  } do
    before (:each) do
      visit "/users/sign_up"
      fill_in "Email", with: "hack@hack.com"
      fill_in "Password", with: "asdfasdf"
      fill_in "Password confirmation", with: "asdfasdf"
      within ".new_user" do
        click_on "Sign up"
      end
    end

    it "edit a question" do
      visit '/posts/new'

      fill_in "Title", with: "This is a post with a title more than forty characters, I think............"
      fill_in "Description", with: "This description is too short (minimum of 150 characters)
      words words words words words words words words words words words words words words words
      words words words words words words words wyords words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Submit"


      expect(page).to have_content "You have successfully submitted a post"
      expect(page).to have_content "This is a post with a title more than forty characters, I think............"
      expect(page).to have_content "This description is too short (minimum of 150 characters)
      words words words words words words words words words words words words words words words
      words words words words words words words wyords words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Edit Question"

      fill_in "Title", with: "How to add total commits from certain authors together when using git shortlog?"
      fill_in "Description", with: "C and Ry are Chris and Ryan but they somewhere down the line, they changed their author name.
      Is it possible to add their commits accordingly so it outputs to only one name? Their author names have changed quite a few times.
      I know there will be need to be some manual mapping that needs to be specified where you have to say like Ry, R, Rya must output to Ryan and that's totally fine.
      Just wondering how I should go about spitting out the results and adding them together in some bash function?"

      click_on "Submit"

      expect(page).to have_content "You have successfully edited the post"
      expect(page).to have_content "How to add total commits from certain authors together when using git shortlog?"
      expect(page).to have_content "C and Ry are Chris and Ryan but they somewhere down the line, they changed their author name.
      Is it possible to add their commits accordingly so it outputs to only one name? Their author names have changed quite a few times.
      I know there will be need to be some manual mapping that needs to be specified where you have to say like Ry, R, Rya must output to Ryan and that's totally fine.
      Just wondering how I should go about spitting out the results and adding them together in some bash function?"

    end

  end
