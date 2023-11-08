class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false, index: true
      t.text :content, null: false
      t.datetime :published_at, null: false

      t.timestamps
    end
  end
end
