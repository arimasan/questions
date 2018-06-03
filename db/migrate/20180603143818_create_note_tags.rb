class CreateNoteTags < ActiveRecord::Migration[5.1]
  def change
    create_table :note_tags do |t|
      t.references :note, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
