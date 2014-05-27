require 'spec_helper'

describe 'User can manage games' do

  it 'can display the games available to join page' do
    visit games_path
    expect(page).to have_content "Available Games"
  end

  it 'can create a game' do
    visit games_path
    click_link('create room')
    fill_in :groupname , with: "Room1"
    select('4', from: :max_members)
    check(:is_public)
    click_button('submit')
    expect(page).to have_content("Room1")
  end

  it 'can ' do

  end

end
