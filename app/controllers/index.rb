require 'debugger'

get '/' do
  # Look in app/views/index.erb
  erb :index
end


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
	@category = Post.all
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
	erb :'/posts/index'
end

put '/posts/:id' do
	@post = Post.update_attributes(params)
	erb :'/posts/show'
end

delete '/posts/:id' do 
	Post.delete(params[:id])
	erb :'/posts/index'
end
