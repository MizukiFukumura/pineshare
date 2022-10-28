class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :pines, dependent: :destroy
         validates :name, presence: true #追記マイページ機能
         validates :profile, length: { maximum: 200 }
  
         has_many :likes, dependent: :destroy
         has_many :liked_pines, through: :likes, source: :pine

         def already_liked?(pine)
          self.likes.exists?(pine_id: pine.id)
        end

        has_many :comments, dependent: :destroy 


       

  end
