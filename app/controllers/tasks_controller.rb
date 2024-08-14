class TasksController < ApplicationController
  def index 
    @task = Task.all.order( created_at: :desc )
  end

  def new
    @task = Task.new
  end

  def show 
    @task = Task.find(params["id"])
  end


  def create

    date = task_params[:date]
    time = task_params[:time]
    update_data = task_params.except(:date, :time)
    update_data[:done_at] = Time.zone.parse("#{date} #{time}")
    @task = Task.new(update_data)

    if @task.save
      flash[:notice] = t('flash_msg.new')
      redirect_to action: :index 
    else
      render 'new'
    end
  end

  def update 
    
    date = task_params[:date]
    time = task_params[:time]

    @task = Task.find(params[:id])
    update_data = task_params.except(:date, :time)
    update_data[:done_at] = Time.zone.parse("#{date} #{time}")
    
    if @task.update(update_data)
      flash[:notice] = t('flash_msg.update')
      redirect_to action: 'index' 
    else
      render :show
    end
  end

  def destroy
    @task = Task.find(params["id"])
    @task.destroy
    flash[:notice] = t('flash_msg.delete')
    redirect_to action: 'index'
  end
  

  private
  
  def task_params
    params.require(:task).permit(:task_name, :description, :date , :time)
  end

end 