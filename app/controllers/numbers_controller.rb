class NumbersController < ApplicationController
  def index
    session[:secret] = rand(100) + 1 unless session[:secret]
  end

  def guess
    if params[:guess].to_f > session[:secret]
      flash[:wrong] = "Too high!"
    elsif params[:guess].to_f < session[:secret]
      flash[:wrong] = "Too low!"
    else
      flash[:right] = "You did it! The number was #{session[:secret]}"
    end
    redirect_to '/'

  end

  def reset
    session.clear
    redirect_to '/'
  end
end
