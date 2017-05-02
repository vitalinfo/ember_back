class Api::V1::TasksController < Api::V1::BaseController

  def index
    render_json_success current_user.tasks
  end
end
