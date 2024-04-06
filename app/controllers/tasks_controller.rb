class TasksController < ApplicationController
    before_action :authenticate_user!
    def index
        @my_tasks= current_user.tasks
        @my_tasks=Task.order('creation_date ')
    end

    def new
        puts authenticate_user![:id]
        @my_task=Task.new
        @my_task.user=current_user
    end
    def alltask
        @my_tasks=Task.order('creation_date')
    end
    def update
        @my_task=Task.find(params[:id])
        if @my_task.update(task_params)
            redirect_to '/tasks'
        else 
            render :edit
        end
    end

    def edit
        @my_task=Task.find(params[:id])
        @my_task.save
    end

    def create
        puts task_params
        @my_task=Task.new(title: task_params[:title], description: task_params[:description], creation_date: task_params[:creation_date], user_id:authenticate_user![:id])
        @my_task.user=current_user
        if @my_task.save
            redirect_to tasks_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @my_task=Task.find(params[:id])
    end

    def destroy
        @my_task=Task.find(params[:id])
        @my_task.destroy
        redirect_to '/tasks'
    end

    def task_params
        params.require(:task).permit(:title , :description , :creation_date)
    end

end
