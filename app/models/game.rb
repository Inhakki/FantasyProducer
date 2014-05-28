class Game < ActiveRecord::Base

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :groupname, presence: true
  validates :max_members, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4}
  validates_uniqueness_of :groupname, case_insensitive: true

end
