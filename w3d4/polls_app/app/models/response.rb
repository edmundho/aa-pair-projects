# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  
  validates :user_id, :answer_id ,presence:true 
  validate :respondent_already_answered?
  validate :author_own_response?
  
  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User 
  
  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :AnswerChoice
  
  has_one :question,
  through: :answer_choice,
  source: :question
  
  
  def sibling_responses
    question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    sibling_responses.exists?(respondent.id)
  end
  
  def author_own_response?
    answer_choice.question.poll.user_id != respondent.id
  end
  
  
end
