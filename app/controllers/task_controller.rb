class TaskController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: %i[update destroy]
  before_action :set_task, only: %i[edit update destroy show]
  before_action :sort_task, only: %i[index show]

  def index
      @task = @categories.tasks  
  end

  def show
  end

  def new
    @tasks = @categories.tasks.build
  end

  def edit
  end

  def create
    @tasks = @categories.task.create(tasks_params)

      if @tasks.save
        redirect_to category_task_path(@categories), notice: "Task was successfully created."
      else
       render :new
    end
  end

  def update
      if @tasks.update(tasks_params)
        redirect_to category_task_path, notice: "Successfully updated task!"
      else
       render :edit
    end
  end

  def destroy
    @tasks.destroy

     redirect_to category_task_path, notice: "Task was successfully deleted."
  end

  private
    def set_categories
      @categories = current_user.category.find(params[:categories_id])
    end

    def set_tasks
      @categories = current_user.category.find(params[:categories_id])
      @tasks = @categories.task.find(params[:id])
    end

    def tasks_params
      params.require(:tasks).permit(:title, :body, :date, :categories_id, :checked)
    end

    def sort_tasks
      @today = @categories.task.where('date = ?', Date.current)
      @scheduled = @categories.task.where('date > ?', Date.current)
      @overdue = @categories.task.where('date < ?', Date.current)
    end
end
