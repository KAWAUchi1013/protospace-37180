#prototypes_controller.rb
class PrototypesController < ApplicationController
  before_action :authenticate_user!, only:[ :delete,:new,:edit]
  before_action :move_to_index, except: [:index, :show ,:new]
  protect_from_forgery with: :null_session
  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
  end
  def create

    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
       
  end
  def edit
    @prototype = Prototype.find(params[:id])
  end
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end

  end
  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    end    
  end

  def move_to_index
    unless current_user == @prototype.user
      redirect_to action: :index
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
