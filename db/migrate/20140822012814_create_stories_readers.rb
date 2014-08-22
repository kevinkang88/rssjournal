class CreateStoriesReaders < ActiveRecord::Migration
  def change
    create_table :stories_readers do |t|
      t.belongs_to :story
      t.belongs_to :reader 
      t.timestamps
    end
  end
end
