class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
        t.string :title
        t.text :body
        t.datetime :publish_date
        t.boolean :mark_important, default: false
        t.boolean :mark_later, default: false
        t.boolean :mark_star, default: false
        t.timestamps
    end
  end
end
