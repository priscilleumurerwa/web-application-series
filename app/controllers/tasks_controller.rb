class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
   before_action :authorize

  # GET /tasks
  # GET /tasks.json
  def index
    # @tasks = Task.search(params[:term])
     #@tasks = Task.all
     
    
    @tasks = if params[:term1]
      #Label.where('name ILIKE ?' , "%#{params[:term]}%").page params[:page]
    
      Task.joins(:labels)
       .where("labels.name ILIKE ?", "%#{params[:term1]}%"). page params[:page]
    else

     # @tasks = Task.order('name').page params[:page]
      #Task.order('priority DESC').page(params[:page])
      Task.order_list(params[:sort_by]).page params[:page]
    end
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    

     @task = current_user.tasks.build(task_params)

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

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = current_user.tasks.build(task_params)
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

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def search
  @task =task.search(params[:search])
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :content, :status, :priority, :beginning_date, :ending_date , :user_id, label_ids:[])
    end
end
