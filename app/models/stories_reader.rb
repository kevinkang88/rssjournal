class StoriesReader < ActiveRecord::Base
  attr_accessible :story_id, :reader_id
  belongs_to :story 
  belongs_to :reader 
  before_save :make_sure_reader_exists

  def make_sure_reader_exists
    if Reader.all.map{|x|x.id}.include?(self.reader.id)
        return
    end
  end
end
