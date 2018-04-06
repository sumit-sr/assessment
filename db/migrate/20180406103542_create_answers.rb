class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|

      t.integer :question_id
      t.string :selected_option
      t.integer :user_id
      t.timestamps
    end
  end
end
