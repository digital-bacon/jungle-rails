module AuthenticateAdminConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin
  end

  def authenticate_admin
    credentials = Rails.configuration.admin_credentials
    http_basic_authenticate_or_request_with name: credentials[:admin_user], password: credentials[:admin_password]
  end
end