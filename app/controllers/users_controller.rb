class UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]

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
  
  def search
    @results = @q.result
  end

  private
  def to_do_params
    params.require(:to_do).permit(:day, :body, :user_id)
  end
  
  def set_q
    @q = User.ransack(params[:q])
  end
end
