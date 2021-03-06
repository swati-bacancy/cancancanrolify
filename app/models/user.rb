class User < ApplicationRecord
  has_many :products, dependent: :destroy
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role

   def assign_default_role
     self.add_role(:customer) if self.roles.blank?
   end
end
