class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @to_dos = @user.to_dos
    @to_do = ToDo.new
    @to_do.user_id = current_user
  end

  def create
    ToDo.create(to_do_params)
    @to_dos = ToDo.all
  end

  private
  def to_do_params
    params.require(:to_do).permit(:day, :body, :user_id)
  end
end
