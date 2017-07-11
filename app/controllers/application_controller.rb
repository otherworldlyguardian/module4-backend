class ApplicationController < ActionController::API

  def issue_token payload
    JWT.encode payload, hmac_secret, 'HS256'
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
    decoded_token.first['id']
  end

  def decoded_token
    if token
      begin
        JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'}
      rescue
      [{}]
      end
    else
      [{}]
    end
  end

end
