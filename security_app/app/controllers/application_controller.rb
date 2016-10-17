class ApplicationController < ActionController::Base
  force_ssl if: :ssl_configured?
  protect_from_forgery with: :exception

  def default_url_options(options={})
    options.merge!(protocol: 'https') if Rails.env.production?
    options
  end

  protected

  def admin_only
    unless current_admin.admin?
      redirect_to admins_webcams_path, alert: "Access denied."
    end
  end

  private

  def ssl_configured?
    Rails.env.production?
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.class == Admin
      admins_webcams_path
    else
      super
    end
  end
end
