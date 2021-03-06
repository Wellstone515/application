class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def index
    @book = Book.new
  	@users = User.all
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
      render :edit
    end

  end




  private
  def user_params
  	params.require(:user).permit(:name, :opinion, :introduct, :image)
  end
end
