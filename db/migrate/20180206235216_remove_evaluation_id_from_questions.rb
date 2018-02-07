class RemoveEvaluationIdFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :evaluation_id, :integer
  end
end
