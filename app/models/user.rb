class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age
  belongs_to :residence
  has_many :tweets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :profile, presence: true
  validates :gender_id, :residence_id, :age_id, numericality: { other_than: 1 , message: "can't be blank"}
end
