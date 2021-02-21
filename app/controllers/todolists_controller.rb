class TodolistsController < ApplicationController
  def new
    @list = List.new
    @lists = List.all
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to "/todo/#{list.id}"
  end

  def index
    @all_list = List.all
    p @all_list
  end

  def show
    @list = List.find_by(id:params[:id])
  end

  def edit
    @list = List.find_by(id:params[:id])
  end

  def update
    list = List.find_by(id:params[:id])
    list.update(list_params)
    redirect_to "/todo/#{list.id}"
  end

  def destroy
    list = List.find_by(id:params[:id])
    list.destroy
    redirect_to todo_index_path
  end


  private
  # ストロングパラメータ
  # titleとbodyの要素を受け取る
  # モデル名_paramsという名前で関数を作る
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
