class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: :create

  def new
    @comment = Comment.new
  end

  def create
    @commentable.comments.build(comment_params)
    @commentable.save
  end


  # def create
  #   @question = Question.find(params[:question_id])
  #   @comment = @question.comments.create(params[:comment].permit(:comment, :parent_id))
  #   @comment.user_id = current_user.id if current_user    
  #   if @comment.save
  #     redirect_to question_path(@question)
  #   else
  #     render 'edit'
  #   end
  # end

  def edit
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])

    if @comment.update(params[:comment].permit(:comment))
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id]) 
    elsif params[:question_id]
      @commentable = Question.find_by_id(params[:question_id])
    end
  end
end
