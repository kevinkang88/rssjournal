class Story < ActiveRecord::Base
  attr_accessible :title, :body, :publish_date, :mark_important, :mark_later, :mark_star
  has_many :stories_readers
  has_many :readers, through: :stories_readers
  has_many :thoughts
  validates :title, presence: true
end
