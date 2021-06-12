class CreateReadingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_lists do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
