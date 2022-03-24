require 'sinatra'
require 'pry'

class SinatraPracticeApp < Sinatra::Base

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

  patch "/blogs/:id/edit" do
    @blog = Blog.find(params[:id])
    if @blog.update(params[:blog])
      redirect to "/blogs/#{@blog.id}"
    else
      erb :edit
    end
  end

  post '/blogs/:id/destroy' do
    blog = Blog.find(params[:id])
    blog.destroy
    redirect to("/")
  end
end