class DraftPick < ActiveRecord::Base

  belongs_to :movie
  belongs_to :game

end
