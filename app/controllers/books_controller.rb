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
 if @book.save
    redirect_to book_path(@book.id)
 else
    @user = current_user
    @users = User.all
    @books = Book.all
    render :index
 end 
  end

  def show
   @book = Book.find(params[:id])
    @user = @book.user
   @new_book = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
      flash[:notice] = "you have destroyed book successfully."
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  
  def ensure_correct_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
end