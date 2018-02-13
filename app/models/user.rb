class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   #associations
   has_many :projects, dependent: :destroy

   #validations
   validates :email, :password, :role, presence: true
   validates :email, :uniqueness => {:case_sensitive => false,  scope: :role}
end
