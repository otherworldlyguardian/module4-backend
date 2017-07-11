class ApplicationController < ActionController::API

  def issue_token

  end

  def authorize_user!
    if !current_user.present?
      render json: {error: 'error'}
    end
  end

  def current_user
    @current_user ||= User.find_by(id: token_user_id)
  end

  def token_user_id

  end

  def decoded_token

  end

end
