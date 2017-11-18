class AddFinishedEvaluationIdToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :finished_evaluation_id, :integer
  end
end
