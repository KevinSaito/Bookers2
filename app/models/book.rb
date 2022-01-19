class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                    length:{}
  validates :body, presence: true
  
end
