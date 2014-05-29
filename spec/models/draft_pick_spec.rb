require 'spec_helper'

describe DraftPick do
  it { should belong_to(:game) }
  it { should belong_to(:movie) }
end
