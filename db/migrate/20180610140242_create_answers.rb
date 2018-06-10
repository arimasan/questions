class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :correct_answer
      t.string :practical_answer

      t.timestamps
    end
  end
end
