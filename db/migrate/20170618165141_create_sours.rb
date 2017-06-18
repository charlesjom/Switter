class CreateSours < ActiveRecord::Migration[5.1]
  def change
    create_table :sours do |t|
      t.references :swit, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
