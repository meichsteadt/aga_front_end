class CategoriesController < ApplicationController
  def index

  end

  def show
    @category = Category.find_by_name(params[:id])
  end
end
