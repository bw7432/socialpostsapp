class V1::UsersController < ApplicationController

  def vote
    @user = User.find(params[:id])
    head 200
  end

end
