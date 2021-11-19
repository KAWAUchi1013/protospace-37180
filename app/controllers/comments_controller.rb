class CommentsController < ApplicationController
  def create
   @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show" 
      # views/tweets/show.html.erbのファイルを参照しています。
   end
  end
  # createアクション内のtweetと書かれている部分をプロトタイプに変える

  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id,prototype_id: params[:prototype_id])
    # permitの内容をtextにする
  end
end