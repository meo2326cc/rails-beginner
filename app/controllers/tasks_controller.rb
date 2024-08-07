class TasksController < ApplicationController
  def index 
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def show 
    @task = Task.find(params["id"])
  end


  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "成功新增任務"
      redirect_to action: :index 
    else
      render 'new'
    end
  end

  def update 
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:notice] = "成功修改任務"
      redirect_to action: 'index' 
    else
      render :show
    end
  end

  def destroy
    @task = Task.find(params["id"])
    @task.destroy
    flash[:notice] = "資料已刪除!"
    redirect_to action: 'index'
  end
  

  private
  
  def task_params
    params.require(:task).permit(:task_name, :description)
  end

end 