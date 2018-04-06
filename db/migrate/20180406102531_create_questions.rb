class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.string :correct_answer
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
