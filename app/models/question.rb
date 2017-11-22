class Question < ApplicationRecord
  belongs_to :evaluation
  has_many :answers
  has_many :attendees, :through => :answers
  accepts_nested_attributes_for :answers

  validates_uniqueness_of :content

end
