class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
   @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to books_path
    else
      flash[:notice] = "エラーが発生しました"
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  
end