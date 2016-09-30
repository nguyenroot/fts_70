class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  has_many :answers
end
