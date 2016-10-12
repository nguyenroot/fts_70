class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  has_many :exam_questions

  enum status: {start: 0, testing: 1, uncheck: 2, checked: 3}
  scope :newest, ->{order created_at: :desc}

  before_create :create_exam_questions

  after_create :set_default

  accepts_nested_attributes_for :exam_questions

  private
  def create_exam_questions
    confirmed_questions = subject.questions.confirmed
    confirmed_questions.each do |question|
      self.exam_questions.build question_id: question.id,
        is_correct: Settings.exams.default_correct
    end
  end

  def set_default
    self.start!
    self.update marks: Settings.exams.default_marks,
      time: Settings.exams.default_time
  end
end
