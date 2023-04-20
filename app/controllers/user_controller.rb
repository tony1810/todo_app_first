class UserController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password] )
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/posts/#{@user.id}")     
    else
      flash[:notice] = "パスワードもしくはメールアドレスを変えてください"
      redirect_to("/user/new")
    end
  end

  def login 
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to("/posts/#{@user.id}")
      else
        flash[:notice] = "メールアドレスかパスワードが間違っています"
        redirect_to("/home/top")
      end
      
    
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end



end
