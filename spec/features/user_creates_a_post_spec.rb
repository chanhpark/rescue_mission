require 'rails_helper'

feature "User creates a post", %q{
  ```no-highlight
  As a user
  I want to post a question
  So that I can receive help from others} do

    #Acceptance Criteria

    # I must provide a title that is at least 40 characters long
    # I must provide a description that is at least 150 characters long
    # I must be presented with errors if I fill out the form incorrectly

    # context "with valid attributes" do
    before (:each) do
      visit "/users/sign_up"
      fill_in "Email", with: "hack@hack.com"
      fill_in "Password", with: "asdfasdf"
      fill_in "Password confirmation", with: "asdfasdf"
        within ".new_user" do
        click_on "Sign up"
        end
    end

    it "creates a post with valid attributes" do

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
    end

    it "creates a post with invalid title" do
      visit '/posts/new'

      fill_in "Description", with: "This description has to be a minimum of 150 characters
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words"

      click_on "Submit"

      expect(page).to have_content "Title can't be blank Title is too short (minimum is 40 characters)"

    end

    it "create a post with invalid description" do

      visit '/posts/new'

      fill_in "Title", with: "This is a really complicated problem helloooooooooooooooooooo"

      click_on "Submit"

      expect(page).to have_content "Description can't be blank Description is too short (minimum is 150 characters)"

    end

    it "creates a post with no title or description" do
      visit '/posts/new'

      click_on "Submit"

      expect(page).to have_content "Title can't be blank Title is too short (minimum is 40 characters) Description can't be blank Description is too short (minimum is 150 characters) Title Description"


    end

    it "creates a title with less than 40 characters" do

      visit '/posts/new'

      fill_in "Title", with: "rspec help"
      fill_in "Description", with: "This description has to be a minimum of 150 characters
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words"

      click_on "Submit"

      expect(page).to have_content "Title is too short (minimum is 40 characters)"

    end

    it "creates a description with less than 150 characters" do

      visit '/posts/new'

      fill_in "Title", with: "This is a really complicated problem helloooooooooooooooooooo"
      fill_in "Description", with: "short description"

      click_on "Submit"

      expect(page).to have_content "Description is too short (minimum is 150 characters) Title Description short description"
    end

    it "user logs out and tries to post a question" do
    click_on "Logout"

    click_on  "got a Q?"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
