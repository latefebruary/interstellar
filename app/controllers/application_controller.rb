# frozen_string_literal: true

class ApplicationController < ActionController::API
  PER_PAGE = 20
  SECRET_KEY = '7ovdfm,sasd;xvkmsmd'

  before_action :authorized

  def page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per] || PER_PAGE).to_i
  end

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def decoded_token
    header = request.headers['Authorization']
    return unless header

    token = header.split(' ')[1]
    begin
      JWT.decode(token, SECRET_KEY)
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authorized
    return unless current_user.nil?

    render json: { message: 'Please log in' }, status: :unauthorized
  end
end
