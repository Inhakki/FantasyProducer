require 'spec_helper'

describe Game do
  it { should have_many(:memberships) }
  it { should have_many(:users).through(:memberships)}
  it { should validate_presence_of(:groupname) }
  it { should validate_numericality_of(:max_members).is_greater_than_or_equal_to(2).is_less_than_or_equal_to(4) }
end
