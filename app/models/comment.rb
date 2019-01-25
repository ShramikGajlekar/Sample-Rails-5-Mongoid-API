class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic 
  field :body, type: String
  
  embedded_in :post

  validates :body, presence: true
end
