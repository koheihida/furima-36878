class UsersController < ApplicationController

  

  private
  def user_params
    params.require(:user).permit[:nickname,:email,:first_name,:first_name,:first_name_kana,:family_name_kana,:birthday]
  end
end
