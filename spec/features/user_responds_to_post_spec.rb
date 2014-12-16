require 'rails_helper'

feature "User responds to a post", %q{
As a user
I want to answer another user's question
So that I can help them solve their problem

Acceptance Criteria

- I must be on the question detail page
- I must provide a description that is at least 50 characters long
- I must be presented with errors if fill out the form incorrectly
} do

  it "find a form to post a response" do

    visit '/posts/new'
    fill_in "Title", with: "This is a post with a title more than forty characters, I think............"
    fill_in "Description", with: "This description has to be a minimum of 150 characters
    words words words words words words words words words words words words words words words
    words words words words words words words words words words words words words words words
    words words words words words words words words words words words words words words words words
    words words words words words words words words words words words words words words words words "

    click_on "Submit"

    fill_in "Message", with: "thats a really good point billy, you killin it right now but i have one recommendation going foward, gimme money"
  end
end
