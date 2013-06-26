require 'debugger'

get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  erb :index
end

<<<<<<< HEAD
get '/cool_url' do
  puts "[LOG] Getting /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  erb :get_cool_url
end

post '/cool_url' do
  puts "[LOG] Posting to /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  erb :post_cool_url
end
=======

get '/categories' do 
	@categories = Category.all
	erb :'/categories/index'
end

get '/categories/new' do
	erb :'/categories/new'
end

get '/categories/:id' do
	@category = Category.find_by_id(params[:id])
	@category_posts = @category.posts
	erb :'/categories/show'
end

get '/categories/:id/edit' do
	@category = Category.update_attributes(params)
	erb :'/categories/edit'
end

post '/categories' do 
	category = Category.new(params[:category])
	if category.save
		redirect to '/categories'
	else
		erb :'/categories/new'
	end
end

put '/categories/:id' do
	@category = Category.update_attributes(params)
	erb :'/categories/show'
end

delete '/categories/:id' do 
	Category.delete(params[:id])
	erb :'/categories/index'
end


###POSTS####


get '/posts' do 
	@post = Post.all
	erb :'/posts/index'
end

get '/posts/new' do
	erb :'/posts/new'
end

get '/posts/:id' do
	@post = Post.find_by_id(params[:id])
	@post_category = @post.category_id
	erb :'/posts/show'
end

get '/posts/:id/edit' do
	@post = Post.find_by_id(params[:id])
	erb :'/posts/edit'
end

post '/posts' do 
	post = Post.new(params[:post])
	if post.save
		redirect to '/posts'
	else
		erb :'/posts/new'
	end
end

put '/posts/:id' do
	@post = Post.update_attributes(params)
	erb :'/posts/show'
end

delete '/posts/:id' do 
	Post.delete(params[:id])
	erb :'/posts/index'
end
>>>>>>> fb82deb49575b18e292024f106270d0fbd9fa252
