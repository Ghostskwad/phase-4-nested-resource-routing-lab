class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  private

  def render_not_found_response(error)
        render json: { error: error.message }, status: :not_found 
  end

end
