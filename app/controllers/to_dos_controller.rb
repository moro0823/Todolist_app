class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all
  end


  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.user_id = current_user.id
    @to_do.save
    @user = current_user
    @to_dos = @user.to_dos
  end

  def edit
    @to_do = ToDo.find(params[:id])
  end

  def update
    @to_dos = ToDo.all
    @to_do = ToDo.find(params[:id])
    @to_do.update(to_do_params)
    redirect_to user_path
  end

  def destroy
    to_do = ToDo.find(params[:id])
    to_do.destroy
    @to_dos = ToDo.all
    redirect_to to_dos_path
  end

  private
  def to_do_params
    params.require(:to_do).permit(:day, :body, :user_id)
  end


end
