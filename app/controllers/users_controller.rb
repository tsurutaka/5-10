class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def new
    @book = Books.new
  end

  def create
  end

  def index
   @user = current_user
   @users = User.all
   @book = Book.new
  end

  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
       render :edit
    else redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
      @user = User.find(params[:id])
   if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
   else
      render:edit
   end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
