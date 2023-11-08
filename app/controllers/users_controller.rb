# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
      username: user.username,
      token: @token
    }, status: :created
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def handle_invalid_record(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end
