class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = 'Book正常に投稿されました'
      redirect_to @book
    else
      flash.now[:danger] = 'Bookが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    
    if @book.update(book_params)
      flash[:success] = 'Bookは正常に更新されました'
      redirect_to @book
    else
      flash.now[:danger] ='Bookは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @book.destroy
    
    flash[:success] = 'Bookは正常に削除されました'
    redirect_to books_url
  end
  
  private
  
  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:content, :title)
  end
end
