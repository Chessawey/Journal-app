class CategoryController < ApplicationController
  before_action :authenticate_user!, except: :page
  before_action :set_category, only: %i[ show edit update destroy]

  def index
    
  end

  def show
    @task = @categories.tasks
  end

  def new
    @category = current_user.category.build
  end

  def edit
  end

  def create
    @categories = current_user.category.build(category_params)

      if @categories.save
        redirect_to category_path, notice: "Category was successfully created."
      else
        render :new
    end
  end

  def update
      if @categories.update(categories_params)
        redirect_to category_path, notice: "Category was successfully updated."
      else
        render :edit
    end
  end

  def destroy 
    @categories.destroy

    redirect_to category_url, notice: "Category was successfully deleted."
  end

  private

    def set_categories
      @categories = current_user.category.find(params[:id])
    end

    def categories_params
      params.require(:category).permit(:title, :user_id)
    end
end