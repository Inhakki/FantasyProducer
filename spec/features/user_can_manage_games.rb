require 'spec_helper'

describe 'User can manage games' do
  let!(:game) { Game.create( groupname: "Spielbergs", max_members: 3, is_public: true)}

  it 'can display the games available to join page' do
    visit games_path
    expect(page).to have_content "Available Games"
  end

  it 'can create a game' do
    visit games_path
    click_link('create room')
    fill_variables
    expect(page).to have_content("Room1")
  end

  it 'can view available games.' do
    visit games_path
    expect(page).to have_content "Spielbergs"
  end

  it 'can update the attributes of the room.' do
    visit games_path
    click_link('edit room')
    fill_variables
    expect(page).to have_content("Room1")
  end

  private

  def fill_variables
    fill_in :groupname , with: "Room1"
    select('4', from: :max_members)
    check(:is_public)
    click_button('submit')
  end

end
