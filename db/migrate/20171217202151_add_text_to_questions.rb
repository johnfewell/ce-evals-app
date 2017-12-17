class AddTextToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :text, :boolean
  end
end
  
