class Sentence < ActiveRecord::Base
  belongs_to :story

  validates :author, :text, :image_url, :presence => true
end
