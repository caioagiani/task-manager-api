class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :auth_token

  def info
    "#{email} - #{created_at}"
  end

  # attr_accessor :name

  # validates_presence_of :name
end
