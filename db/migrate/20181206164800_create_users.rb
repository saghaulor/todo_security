class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :firstname
      t.string :lastname
      t.string :password, null: false
      t.string :avatar_url
      t.timestamps
      t.index :login, unique: true
      t.index :password
    end
  end
end
