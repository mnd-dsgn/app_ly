# testing branch commitS!!

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :email, 
            :presence => true

  validates :password,
            :length => { :in => 8..24 },
            :allow_nil => true

  validates :email,
            :presence => true,
            :uniqueness => true


  has_many :reviews

  has_many :bookmarks
  has_many :schools, through: :bookmarks
  has_many :reviews, class_name: "Review", foreign_key: :user_id

  # after_create :send_welcome_email

  
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  private

  # def send_welcome_email
  #   UserMailer.welcome(self).deliver!
  # end
  
end
