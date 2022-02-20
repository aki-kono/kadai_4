class UsersController < ApplicationController
  def show
    @book_new = Book.new
    #@user = User.new
    @user = User.find(params[:id])
    #books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
    @books = @user.books
    @book_comment = BookComment.new

  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      #render :show
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:update] = 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def index
    @book_new = Book.new
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end