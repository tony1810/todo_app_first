class PostController < ApplicationController
  
  before_action :auticate_user
  
  def index
    @tasks = Post.where(user_id: params[:id])
    @user = User.find_by(id: @current_user.id)
    if @user.total_done == nil
      @user.update(total_done: 0)
    end
  end

  def create
    @task = Post.new(task: params[:task], user_id: @current_user.id)
    if @task.save
      redirect_to("/posts/#{@task.user_id}")
    else
      redirect_to("/posts/#{@current_user.id}")
      
    end

    def destroy
      @task = Post.find_by(id: params[:id])
      @task.destroy
      @user = User.find_by(id: @current_user.id)
      @user.update(total_done: @user.total_done + 1)
      
      redirect_to("/post/index")
    end



    
    
  end

  

end
