class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ start approve cancel complete  edit update destroy]
  
  def start
    @task.start!
    respond_to do |format|
      puts format
      format.turbo_stream do 
        render turbo_stream: [
          turbo_stream.prepend("task-list-in_progress",
            partial: 'tasks/task_short',
            locals: {task: @task}
          ),
          turbo_stream.remove("task-status-new-#{@task.id}")
        ]
      end
    end
  end

  def approve
    @task.approve
  end

  def cancel
    @task.cancel!
  end

  def complete
    @task.complete!
  end
  
  # GET /tasks or /tasks.json
  def index
    @tasks = {}
    [:new, :in_progress, :completed, :cancelled].each do |s|
      @tasks[s] = Task.where status: s
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.turbo_stream {
           render turbo_stream: turbo_stream.prepend('task-list-new',
             partial: 'tasks/task_short',
             locals: {task: @task}) }
        format.html { redirect_to task_url(@task), notice: "task was successfully created." }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@task, partial: "tasks/task_short", locals: {task: @task}) }
        format.html { redirect_to task_url(@task), notice: "task was successfully updated." }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :ends_at, :deadline_at, :canceled_at, :completed_at)
    end
end
