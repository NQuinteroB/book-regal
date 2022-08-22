class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.boolean :availability
      t.string :book_category
      t.string :language
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
