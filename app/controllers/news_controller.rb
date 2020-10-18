class NewsController < ApplicationController

  def new
    @new = New.new
  end

  def show
    @new = New.find(params[:id])
  end

  def create
    @new = New.create(new_params) #strong parameter
    redirect_to '/news'
  end

  def edit
    @new = New.find(params[:id])
  end

  def update
    New.find(params[:id]).update(new_params)
    redirect_to '/news'
  end

  def delete
    @new = New.find(params[:id])
    @new.destroy
  end

  private
    def new_params
      params.require(:new).permit(:title, :category, :content, :image)
      #このようにして、imageカラムはテーブルにはないにも関わらずあたかもカラムがあるかのように扱うことで、
      #フォームのfile_fieldで選択された画像をCommentオブジェクトと紐付け。Active Storageの特徴の一つ。
    end

end #of_class
