class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.references :user, index: true, foreign_key: true , :null => false
      t.boolean :published_state

      t.timestamps
    end
  end
end
