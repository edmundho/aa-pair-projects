# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  
  validates :poll_id,presence: true 
  
  has_many :answer_choices, 
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice
  
  belongs_to :poll ,
  primary_key: :id ,
  foreign_key: :poll_id ,
  class_name: :Poll 
  
  has_many :responses, 
  through: :answer_choices, 
  source: :responses
  
  <<-SQL
    SELECT 
    COUNT(answer_choices.question_id)
    FROM  
    answer_choices
    JOIN 
    responses ON responses.answer_id = answer_choices.id
    GROUP BY answer_choices.question_id
    
  SQL
  
  def results_improved
    
  end
  
  def results_n_plus_one
    all_answer_choices = answer_choices
    
    choice_counts = Hash.new(0)
    
    all_answer_choices.each do |ac|
      choice_counts[ac] = ac.responses.count
    end
    
    choice_counts
  end
  
  def results_using_includes
    all_answer_choices = answer_choices.includes(:responses)
    
    choice_counts = {}
    
    all_answer_choices.each do |ac|
      choice_counts[ac] = ac.responses.length
    end
    
    choice_counts
  end
end
