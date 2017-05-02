class Api::V1::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)

    sign_in(resource_name, resource)

    yield resource if block_given?

    data = {
        id: resource.id,
        token: resource.authentication_token,
        email: resource.email
    }

    respond_to do |format|
      format.json { render json: data, status: 201 }
      format.html { respond_with resource, location: after_sign_in_path_for(resource) }
    end
  end
end