class School < ActiveRecord::Base
  has_one :academic
  has_one :admission
  has_one :aid
  has_one :completion
  has_one :cost
  has_one :earning
  has_one :repayment
  has_one :student

  has_many :reviews

  has_many :bookmarks
  has_many :users, through: :bookmarks
end
