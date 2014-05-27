require 'spec_helper'

describe 'User can see a homepage' do

  it 'has the title Fantasy Producer' do
    visit root_path
    expect(page).to have_content 'Fantasy Producer'
  end

end
