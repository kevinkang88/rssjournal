class ReadersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @reader = Reader.new(name_first: params["name_first"], name_last: params["name_last"], user_name: params["user_name"],
                   email: params["email"]
                   )
  @reader.password=(params['password'])
  @reader.save
  session[:id] = @reader.id
  redirect_to stories_path
  end
end
