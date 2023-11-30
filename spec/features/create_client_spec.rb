require 'rails_helper'

feature 'create clients' do
  include Capybara::DSL
  
  scenario 'sign up and get create client page' do
    visit('/')
    
    click_on('Sign up')
		fill_in('Email', with: "example@yahoo.cou")
		fill_in('Password', with: "password")
    
    fill_in('Password Confirmation', with: 'password')
		click_button('Sign Up.')
    
    # expect(User.all.length).to eq(1)
    expect(page).to have_content('New client')
  end
end