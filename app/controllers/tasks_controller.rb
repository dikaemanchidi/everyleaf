class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :authenticate_user
  before_action :logged_in?

  def index
    if params[:task].present?
        if params[:task][:task_name].present? && params[:task][:status].present?
          @tasks = Task.task_name_fuzzy_search(params[:task][:task_name]).status_search(params[:task][:status]).page params[:page]
        elsif params[:task][:task_name].present?
          @tasks = Task.task_name_fuzzy_search(params[:task][:task_name]).page params[:page]
  elsif params[:task][:status].present?
          @tasks = Task.status_search(params[:task][:status]).page params[:page]
        else
          @tasks = Task.page(params[:page]).per(10)
        end
      elsif params[:sort_expired]
          @tasks = Task.all.order('startdate DESC').page params[:page]
        elsif params[:sort_priority]
      @tasks = Task.all.order('priority DESC').page params[:page]
  else
      @tasks = current_user.tasks.all.order('created_at DESC').page params[:page]
      @tasks = @tasks.order(created_at: :desc).page(params[:page])
  end
   end


  def show
    if current_user.id != @task.user_id
      flash[:notice] = "Not Allowed!"
      redirect_to tasks_path(session[:task_user])
      return
    end
  end


  def new
    @task = Task.new
  end


  def edit
    if current_user.id != @task.user_id
      flash[:notice] = "Not Allowed!"
      redirect_to tasks_path(session[:task_user])
      return
    end
  end


  def create
    @task = Task.new(task_params)
     @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_task
      @task = current_user.Task.find(params[:id])
    end

    def authenticate_user
          if @current_user == nil
            flash[:notice] = t('notice.login_needed')
            redirect_to new_session_path
          end
        end

    def task_params
      params.require(:task).permit(:task_name, :content, :id, :startdate, :status, :priority)
    end
end
