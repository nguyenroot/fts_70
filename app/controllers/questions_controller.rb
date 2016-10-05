class QuestionsController < ApplicationController
  def new
   load_all_subject
   @question.answers.new
 end
end
