require 'spec_helper'

describe 'User can sign up, sign in and sign out' do
  let!(:user) { User.create(name: 'Joel', email: 'joel.coen@gmail.com', password: 'biglebowski')}

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
    sign_in_user_joel
    expect(page).to have_content 'Hello, Joel'
  end

  it 'can sign out of an account' do
    visit root_path
    sign_in_user_joel
    click_button 'sign out'
    expect(page).to_not have_content 'Hello, Joel'
  end

  private

  def sign_in_user_joel
    click_link 'Sign in'
    fill_in 'Email', with: 'joel.coen@gmail.com'
    fill_in 'Password', with: 'biglebowski'
    click_button('sign in')
  end
end
