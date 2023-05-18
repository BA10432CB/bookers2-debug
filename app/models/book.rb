class Book < ApplicationRecord
  belongs_to :user
  has_many   :favorites,     dependent: :destroy
  has_many   :book_comments, dependent: :destroy
  has_one_attached :profile_image
  validates :title, presence:true
  validates :body,  presence:true, length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(searches, keywords)
    if searches == 'perfect_match'
      @book = Book.where('title LIKE(?)', "#{keywords}")
    elsif searches == 'front_match'
      @book = Book.where('title LIKE(?)', "%#{keywords}")
    elsif searches == 'back_match'
      @book = Book.where('title LIKE(?)', "#{keywords}%")
    else
      @book = Book.where('title LIKE(?)', "%#{keywords}%")
    end
  end
end
