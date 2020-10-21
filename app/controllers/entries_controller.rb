class EntriesController < ApplicationController

  def new
    @entry = Entry.new
  end

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.create(entry_params) #strong parameter
    redirect_to '/news'
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    Entry.find(params[:id]).update(new_params)
    redirect_to '/entries'
  end

  def destroy
    @nentry = Entry.find(params[:id])
    @entry.destroy
    redirect_to '/entries'
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :category, :content, :image)
      #このようにして、imageカラムはテーブルにはないにも関わらずあたかもカラムがあるかのように扱うことで、
      #フォームのfile_fieldで選択された画像をCommentオブジェクトと紐付け。Active Storageの特徴の一つ。
    end

end #of_class
