require 'spec_helper'

describe 'User can sign up, sign in and sign out' do
  it 'can sign up for an account' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Name', with: 'Stanley'
    fill_in 'Email', with: 'SK@odyssey.com'
    fill_in 'Password', with: '2001space'
    fill_in 'Confirm Password', with: '2001space'
    click_button('submit')
    expect(page).to have_content 'Hello, Stanley'
  end

  it 'can sign into an account' do
    visit root_path
    click_link 'Sign in'

  end

  it 'can sign out of an account' do

  end
end
