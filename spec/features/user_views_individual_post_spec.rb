require 'rails_helper'

feature "user views details of a post", %q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria

  - I must be able to get to this page from the questions index
  - I must see the question's title
  - I must see the question's description} do
  before (:each) do
    visit "/users/sign_up"
    fill_in "Email", with: "hack@hack.com"
    fill_in "Password", with: "asdfasdf"
    fill_in "Password confirmation", with: "asdfasdf"
    within ".new_user" do
      click_on "Sign up"
    end
  end

  it "user views details of a post" do

    visit '/posts/new'

    fill_in "Title", with: "Can I have some help? tenletters tenletters tenletters"
    fill_in "Description", with: "We are out to lunch  words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words "

    click_on "Submit"

    visit '/posts'

    click_on "Show"

    expect(page).to have_content "Can I have some help? tenletters tenletters tenletters"
    expect(page).to have_content "We are out to lunch  words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words "


  end
end
