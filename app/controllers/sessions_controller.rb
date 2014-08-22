class SessionsController < ApplicationController
  def create
    @reader = Reader.find_by_user_name(params["user_name"])
    if @reader
      if @reader.password == params[:password]
          session[:id] = @reader.id
          redirect_to stories_path
      else
          redirect_to stories_path
      end
    else
      redirect_to stories_path
    end
  end

  def destroy
    reset_session
    redirect_to stories_path
  end

  def current_user
    @current_user ||= Reader.find(session[:reader_id])
  end
end
