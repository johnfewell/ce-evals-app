class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :location
      t.float :credits
      t.text :learning_objective_1
      t.text :learning_objective_2
      t.text :learning_objective_3
      t.date :start_date
      t.date :end_date
      t.boolean :published
      t.integer :instructor_id
      t.timestamps
    end
  end
end
