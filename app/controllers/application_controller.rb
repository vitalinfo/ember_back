class ApplicationController < ActionController::Base

  private

  def render_json_success(json = {}, status = :ok, params = {})
    render({ json: json, status: status }.merge(params))
  end

end
