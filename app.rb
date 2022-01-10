require 'sinatra/base'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @name = session[:name]
    @option = session[:option]
    @computer_option = session[:computer_option]
    erb :play
  end

  post '/play' do
    session[:option] = params[:option]
    session[:computer_option] = Computer.new.option
    redirect '/play'
  end
# start the server if ruby file executed directly
run! if app_file == $0

end