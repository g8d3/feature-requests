class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,# :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?; role == 'admin' end
  def guest?; role == 'guest' end
end
