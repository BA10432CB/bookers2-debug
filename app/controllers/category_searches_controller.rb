class CategorySearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = Book
    @content = params[:content]
    @books = Book.where("category LIKE?", "%#{@content}%")
    render '/category_searches/search'
  end

end
