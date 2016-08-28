module ApplicationHelper

  def navbar
    if user_signed_in?
      render "layouts/navbarlogin"
    else
      render "layouts/navbar"
    end
  end

end
