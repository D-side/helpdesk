class Users::ResponsesController < ApplicationController
  before_filter :authenticate_user!, :fetch_response, :redirect_unauthorized

  def edit
  end

  def update
    if @response.update_attributes(response_params)
      redirect_to [:users, @response.ticket]
    else
      render :edit
    end
  end

  private

  def fetch_response
    @response = Response.find()
  end

  def redirect_unauthorized
    unless @response.editable_by?(current_user)
      flash[:error] = 'You are not authorized to edit this response'
      redirect_to [:users, :tickets]
    end
  end

  def response_params
    params.require(:response).permit(:body)
  end
end
