require 'spec_helper'

describe User do
  it { should have_many(:memberships) }
  it { should have_many(:games).through(:memberships)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
