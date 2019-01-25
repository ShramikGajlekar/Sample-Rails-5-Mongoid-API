class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic 
  field :desc, type: String
  field :title, type: String
	
	belongs_to :user
	embeds_many :comments

	validates :title, presence: true
  validates :desc, presence: true
end
