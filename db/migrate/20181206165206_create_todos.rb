class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.boolean :shareable, default: false
      t.timestamps
    end
  end
end
