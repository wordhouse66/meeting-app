require 'rails_helper'

feature 'calendar search' do
  include Capybara::DSL
  scenario '' do
    visit('/calendars')
    
    expect(page).to have_content('Calendar Search')
  end
end