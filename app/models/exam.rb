class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  has_many :exam_questions

  enum status: {start: 0, testing: 1, uncheck: 2, checked: 3}
  scope :newest, ->{order created_at: :desc}
end
