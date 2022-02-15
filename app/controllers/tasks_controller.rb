class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # get data from the form (params)
    # create a new Restaurant object/instance with that data!
    task = Task.new(tasks_params)
    # save it
    task.save
    # go somewhere...?
    redirect_to task_path(task)
  end

  def edit; end

  def update
    # find the restaurant by its id
    # update it with the data from params
    # redirect to show page for the restaurant
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
