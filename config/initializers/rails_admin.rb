RailsAdmin.config do |config|

  # Set App name on nav header
  config.main_app_name = Proc.new{ |controller| ["Onebnb", "Admin - #{controller.params[:action].try(:titleize)}"] }
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    if current_user.kind != "admin"
      reset_session
      redirect_to '/user/sign_in'
    end
  end

  config.excluded_models << "Photo"

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
