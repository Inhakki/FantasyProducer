require 'spec_helper'

describe 'User can join a game' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:game) { Game.create( groupname: 'Camerons', max_members: 4, is_public: true) }

  it 'inducts itself into the game user list.' do
    login(user)
    visit games_path
    click_button('join')
    expect(page).to have_content '#{user.name}'
  end

  def login(user)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end
