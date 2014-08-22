class CommentsController < ApplicationController
  def create
    newcomment = Comment.create(body: params[:comment][:body],
                               story_id: params[:story_id],
                               reader_id: session[:id])
    if session[:id]
      render partial: 'new_comment', locals: { comment: newcomment,
                                              username: Reader.find(session[:id]).user_name }
    else
      render json: { status: 404 }
    end
  end
end
