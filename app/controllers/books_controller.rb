class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:create] = 'You have created book successfully.'
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books
  end


  # 遷移できず、投稿一覧画面にリダイレクトされる (FAILED -
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end
  # def edit
  #   @book = Book.find(params[:id])
  # end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      #redirect_to books_path(@book)
      flash[:update] = 'You have updated book successfully.'
    else
      render :edit
      #flash[:update] = 'akann'
    end
  end

  def destroy
    @book= Book.find(params[:id])
    @book.destroy
    #@user = User.find(params[:id])
    @user = User.new
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end