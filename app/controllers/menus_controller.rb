class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menu_params) #strong parameter
    @menu.image.attach(params[:menu][:image])
    if @menu.save
      flash[:success]="Menu created!"
      redirect_to '/menus'
    else
      render 'menus/new'
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    Menu.find(params[:id]).update(menu_params)
    redirect_to '/menus'
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to '/menus'
  end

private
  def menu_params
    params.require(:menu).permit(:name, :comment, :image)
  end

end#ofClass
