class CreateBookRosters < ActiveRecord::Migration[5.2]
  def change
    create_table book_rosters do |t|
      t.integer :book_id
      t.integer :reading_list_id
  end
end
