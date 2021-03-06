class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :email
      t.string	:firstname
      t.string	:middlename
      t.string	:lastname
      t.string	:password_digest

      t.timestamps
    end
      add_index :users, :email, unique: true
  end
end