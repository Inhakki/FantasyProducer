require 'spec_helper'

describe Movie do
  it { should have_many(:draft_picks) }
  it { should have_many(:games).through(:draft_picks) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:year) }
  it { should validate_numericality_of(:budget) }
  it { should validate_numericality_of(:gross) }
  it { should validate_presence_of(:img_url)}
end
