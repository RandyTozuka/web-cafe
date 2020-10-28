class StaticPagesController < ApplicationController

  def home
  end

  def show
    @entries = Entry.all
  end

end
