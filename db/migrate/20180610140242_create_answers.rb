class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :record, index: true, foreign_key: true
      t.string :correct_answer
      t.string :practical_answer

      t.timestamps
    end
  end
end
