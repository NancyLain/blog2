class CommentsController < ApplicationController
  before_action :find_micropost
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!


  skip_authorize_resource :only => :current_user


   def index
     @comments = Comment.all
   end


  def show
  end

   def new
    @comment = Comment.new
  end

  def edit
  end

  def create

    @comment = current_user.comments.new(comment_params)
    @comment.micropost_id = @micropost.id

    if @comment.save
      respond_to do |format|
      format.js
      end
    else
      render 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to micropost_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    # redirect_to micropost_path(@micropost)
    respond_to do |format|
      format.js
      end

  end

  private

    def find_comment
      @comment = Comment.find(params[:id])
    end

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
