class Users::RegistrationsController < Devise::RegistrationsController

  def edit
    if current_user.provider == "google_oauth2"
      render "devise/registrations/oauth_edit.html.erb"
    else
      render :edit
    end
  end

  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if current_user.provider == "google_oauth2"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

end