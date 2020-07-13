class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_messages, foreign_key: 'sender_id', class_name:'Message'
  has_many :received_messages, foreign_key: 'recipient_id', class_name:'Message'
end
