require 'rails_helper'
require_relative '../support/user_page_form'

feature 'home page' do
  scenario 'sign up page shows up if user not signed in' do
    visit('/')
    expect(page).to have_content('Sign in to start your session')
  end

  scenario 'welcome message shows if user is signed in' do
  end
end