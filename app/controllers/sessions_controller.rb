class SessionsController < Devise::SessionsController
    def create
        self.resource = warden.authenticate!(auth_options)

        sign_in(resource_name, resource)

        yield resource if block_given?
        data = {
        user_id: resource.id,
        email: resource.email,
        token: resource.authentication_token
        }

        render json: data, status: 201
    end
end
