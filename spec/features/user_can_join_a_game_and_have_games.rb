require 'spec_helper'

describe 'User can join a game' do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:user3) { FactoryGirl.create(:user) }
  let!(:game) { Game.create( groupname: 'Camerons', max_members: 2, is_public: true) }

  it 'inducts itself into the game user list.' do
    login(user)
    user_joins
    expect(page).to have_content user.name
  end

  it 'has the game name in the user profile' do
    login(user)
    user_joins
    visit user_path(user)
    expect(page).to have_content 'Camerons'
  end

  it 'cannot have more than the maximum members' do
    overload_room
    user3_count = page.body.scan(user3.name).count
    expect(user3_count).to_not have_content 2
  end

  it 'shows error when game is full' do
    overload_room
    expect(page).to have_content 'The game is full.'
  end

  it 'allows you to leave the room' do
    login(user)
    user_joins
    click_button 'leave room'
    visit games_path
    expect(page).to have_button 'join room'
  end

  it 'prevents you from leaving if you are not in the room' do
    login(user)
    user_joins
    click_button 'leave room'
    expect(page).to_not have_button 'leave room'
  end

  def overload_room
    login(user)
    user_joins
    login(user2)
    user_joins
    login(user3)
    user_joins
  end

  def user_joins
    visit games_path
    click_button('join')
  end

  def login(user)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end
