require 'jwt'
class Api::V1::UsersController < ApplicationController
  #before_action :set_category, only: [:show, :edit, :update, :destroy]
  def getToken
    #Encriptar USER_ID, CARGO
    @user = User.where(:username => user_params[:username], :password => user_params[:password]).first
    if @user
      payload = {
        user: @user.id,
        charge_id: '01'
      }
      @@keyEncode = "12345"
      token = JWT.encode payload, @@keyEncode, 'HS256'
      #decoded_token = JWT.decode token, @@keyEncode, true, :algorithm => "HS256"
      render :json => { :status => 200, result: {:token => token}, :message => "Ok" }
    else
      render :json => { :success => false, :message => "No existe el usuario." }
    end
  end

  def decodedToken
    raise params[:token].inspect.to_yaml
  end

  private
    def user_params
      params.require(:data).permit(:username, :password)
    end
end
=begin
{
  success: false,
  msg: "usuario no exists",
  token: 'fjhfhgzjhfzjygfzs5jyrhyazry'
}
=end