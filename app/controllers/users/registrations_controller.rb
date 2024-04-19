class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    user_profile_path
  end

  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  def respond_with(resource, opts = {})
    if resource.errors.any?
      clean_up_passwords(resource)
      set_minimum_password_length
      flash.now[:error] = resource.errors.full_messages.join(', ')
    else
      super
    end
  end
end
