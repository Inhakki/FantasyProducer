class Movie < ActiveRecord::Base

  has_many :draft_picks, dependent: :destroy
  has_many :games, through: :draft_picks

  validates :title, presence: true
  validates :year, numericality: { only_integer: true }
  validates :budget, numericality: { greater_than_or_equal_to: 0 }
  validates :gross, numericality: { greater_than_or_equal_to: 0 }
  validates :img_url, presence: true

end
