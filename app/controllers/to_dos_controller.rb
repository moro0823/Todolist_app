class ToDosController < ApplicationController
  def index
  end


  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.user_id = current_user.id
    @to_do.save
    @to_dos = ToDo.all
  end

  def edit
    @to_do = ToDo.find(params[:id])
    @to_do.update(to_do_params)
    @to_dos = ToDo.all
  end

  def update
    @to_dos = ToDo.all
    @to_do = ToDo.find(params[:id])
    @to_do.user_id = current_user.id
    @to_do.update(to_do_params)
  end

  def destroy
    to_do = ToDo.find(params[:id])
    to_do.destroy
    @to_dos = ToDo.all
  end

  private
  def to_do_params
    params.require(:to_do).permit(:day, :body, :user_id)
  end


end
