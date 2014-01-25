class Question < ActiveRecord::Base
  attr_accessor :a, :b, :c, :d

  belongs_to :subject

  validates :subject_id, presence: true
  validates :type, presence: true
  validates :content, presence: true
end
