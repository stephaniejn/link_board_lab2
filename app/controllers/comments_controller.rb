class CommentsController < ApplicationController

  def new_comment
    @parent_comment = Comment.find_by_id(params[:id])
    @comment = Comment.new
  end

  def create_vote
      return unless is_authenticated?
      user = User.find_by_id(@current_user['id'])
      comment = Comment.find_by_id(params[:id])
      if comment.votes.where(user_id: user[:id]).length <1
      user.votes << comment.votes.create()
          # render json:
          redirect_to post_comments_path(parent_post(comment))
        else
          flash[:danger] = 'You already voted on me'
          redirect_to post_comments_path(parent_post(comment))
    end
  end

  def create_comment
      return unless is_authenticated?
      user = User.find_by_id(@current_user['id'])
      comment = Comment.find_by_id(params[:id])
      user.comments << comment.comments.create({body:params[:comment][:body]})
      redirect_to post_comments_path(parent_post(comment))
  end

  private
  def parent_post comment
      return comment if comment.class == Post
      return parent_post(comment.commentable)
  end

  # non-recursive method
   # until comment.class == Post
   # comment = comment.commentable
    # end
    # comment

end
