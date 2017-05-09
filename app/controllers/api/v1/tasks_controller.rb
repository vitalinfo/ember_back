class Api::V1::TasksController < Api::V1::BaseController

  def index
    render_json_success current_user.tasks
  end

  def create
    task = current_user.tasks.build(task_params)
    if task.save
      render_json_success task
    else
      render_json_error(task.errors)
    end
  end

  def update
    task = current_user.tasks.find(params[:id])
    if task.update(task_params)
      render_json_success task
    else
      render_json_error(task.errors)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_at, :completed)
  end
end
