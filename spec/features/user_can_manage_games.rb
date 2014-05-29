require 'spec_helper'

describe 'User can manage games' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:game) { Game.create( groupname: 'Spielbergs', max_members: 3, is_public: true)}

  it 'can display the games available to join page' do
    visit games_path
    expect(page).to have_content 'Available Games'
  end

  it 'can create a game' do
    login(user)
    visit games_path
    click_link('create room')
    fill_variables
    expect(page).to have_content 'Room1'
  end

  it 'can view available games.' do
    visit games_path
    click_link('Spielbergs')
    expect(page).to have_content 'Spielbergs'
  end

  it 'can update the attributes of the room.' do
    login(user)
    visit games_path
    click_link('edit room')
    fill_variables
    expect(page).to have_content 'Room1'
  end

  it 'can destroy games with no users' do
    login(user)
    visit games_path
    click_button('destroy')
    expect(page).to_not have_content 'Spielbergs'
  end

  private

  def fill_variables
    fill_in 'Room Name' , with: 'Room1'
    select('4', from: 'Number of Players')
    check('Public?')
    click_button('submit')
  end

  def login(user)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

end
