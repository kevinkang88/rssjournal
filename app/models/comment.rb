class Comment < ActiveRecord::Base
    attr_accessible :body, :reader_id, :story_id
      validates :body, presence: :true
      validates :reader_id, presence: :true
end
