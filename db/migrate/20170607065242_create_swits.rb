class CreateSwits < ActiveRecord::Migration[5.1]
  def change
    create_table :swits do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :swits, [:user_id, :created_at]
  end
end
