class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

def new
  redirect_to :root
end

def create
  self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      #redirect_to session[:return_to]
      session[:return_to] = nil
    else
      #respond_with resource, :location => after_sign_in_path_for(resource)
    end

    redirect_to :root
end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
