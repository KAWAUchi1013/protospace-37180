class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
　　params[:tweet_id])
  end
end