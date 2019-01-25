class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic 
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time
  ## Added Fields
  field :first_name, type: String
  field :last_name, type: String
  field :authentication_token, type: String
  field :bio, type: String
  has_many :posts
  embeds_many :addresses


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :capitalize_names_remove_spaces
  
  private
    def capitalize_names_remove_spaces
      self.first_name.capitalize! if self.first_name
      self.last_name.capitalize! if self.last_name
      self.first_name.gsub!(' ','') if self.first_name
      self.last_name.gsub!(' ','') if self.last_name
    end
  ## Trackable
  # field :sign_in_count,      type: Integer, default: 0
  # field :current_sign_in_at, type: Time
  # field :last_sign_in_at,    type: Time
  # field :current_sign_in_ip, type: String
  # field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
