class SinatraPracticeApp < Sinatra::Base
  require 'sinatra'
  require 'pry'

  get '/' do
    @blogs = Blog.all
    erb :"blogs/index"
  end

  get '/new' do
    erb :"blogs/new"
  end

  post '/' do
    blog = Blog.new(params["blog"])
    if blog.save
      redirect "/blogs/#{blog.id}"
    else
      erb :"blogs/new"
    end
  end

  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :"blogs/show"
  end

  put '/blogs/edit/:id' do
    blog = Blog.find(params[:id])
    erb :"blogs/show"
  end
  post '/blogs/destroy/:id' do
    blog = Blog.find(params[:id])
    blog.destroy
    redirect to("/")
  end
end