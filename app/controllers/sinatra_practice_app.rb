class SinatraPracticeApp < Sinatra::Base
  require 'sinatra'
  require 'pry'

  get '/' do
    redirect to('blogs/index')
  end

  get '/blogs/index' do
    @blogs = Blog.all
    erb :"blogs/index"
  end

  get '/blogs/new' do
    @blog = Blog.new
    erb :"blogs/new"
  end

  post '/blogs/create' do
    @blog = Blog.new(params["blog"])
    if @blog.save
      redirect to("/blogs/#{@blog.id}")
    else
      erb :"blogs/new"
    end
  end
  
  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :"blogs/show"
  end

  get '/blogs/:id/edit' do
    @blog = Blog.find(params[:id])
    erb :"blogs/edit"
  end

  patch "/blogs/:id" do
    @blog = Blog.find(params[:id])
    if @blog.update(params.slice(:title, :content))
      redirect to "/blogs/#{@blog.id}"
    else
      erb :edit # re-render the form
    end
  end

  post '/blogs/:id/destroy' do
    blog = Blog.find(params[:id])
    blog.destroy
    redirect to("/")
  end
end