class Api::V1::BaseController < ApplicationController
  acts_as_token_authentication_handler_for User
  prepend_before_action :normilize_simple_auth_headers

  private

  def normilize_simple_auth_headers
    request.headers['HTTP_AUTHORIZATION'].to_s.match(/token="(.+)", email="(.+)"/)
    request.headers['X-User-Token'] = $1
    request.headers['X-User-Email'] = $2
  end
end