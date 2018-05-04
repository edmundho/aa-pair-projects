class UpdateIncorrectIndices < ActiveRecord::Migration[5.1]
  def change
    remove_index :answer_choices, :question_id
    remove_index :responses, :user_id
    remove_index :responses, :answer_id
    add_index :responses, [:answer_id, :user_id], unique: true
  end
end
