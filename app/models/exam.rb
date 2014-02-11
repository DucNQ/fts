class Exam < ActiveRecord::Base
  belongs_to :subject
  has_many :exam_details, dependent: :destroy

  validates :subject_id, presence: true
  validates :name, presence: true
  validates :duration, presence: true, numericality: {only_integer: true}

  accepts_nested_attributes_for :exam_details, reject_if: ->attrs { attrs['question_type'].blank? }, allow_destroy: true
end
