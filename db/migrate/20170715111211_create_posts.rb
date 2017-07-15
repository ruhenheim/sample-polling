class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.boolean :scraping_completed

      t.timestamps
    end
  end
end
