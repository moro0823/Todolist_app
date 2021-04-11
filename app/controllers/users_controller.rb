class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @to_dos = ToDo.all
    @to_do = ToDo.new
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
