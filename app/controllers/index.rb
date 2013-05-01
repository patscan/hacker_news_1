get '/post/all' do

  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

post '/login' do
  @user = User.authenticate(params["username"], params["password"])
  if @user
    session[:user_id] = @user.id
    redirect ("/profile/#{@user.id}")
  else 
    redirect '/post/all'
  end
end

post '/signup' do

  @user = User.create(params["username"], params["password"])
  if @user
    session[:user_id] = @user.id
    redirect "/profile/#{@user.id}"
  else
    redirect "/post/all"
  end
end

get '/profile/:id' do
  @user = User.find(params["id"])
  erb :profile
end

get '/user/:id/posts' do
  @user = User.find(params["id"])
  @posts = @user.posts
  erb :user_posts
end

get "/post/new" do
  erb :new_post
end

post "/post/new" do
  post = Post.create(title: params["title"], content: params["content"])
  current_user.posts << post
  redirect "/profile/#{current_user.id}"
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/user/:id/comments' do
  @user = User.find(params["id"])  
  erb :user_comments
end





