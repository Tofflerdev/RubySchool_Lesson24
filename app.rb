#This is a comment
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/admin' do
	erb :admin
end

get '/logbook' do
	erb :lobook
end	

post '/visit' do
	@form_display = "none"
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@message = "#{@username.capitalize}, мы ждем  Вас  #{@datetime}."
	f = File.open 'public/logbook.txt', 'a'
	f.write "#{@username},#{@phone},#{@datetime} \n"
	f.close
	erb :visit
end
post '/admin' do

	@login = params[:login]
	@password = params[:password]
	
		if @login == "baraban.ms@gmail.com" && @password == "19131014"
			@form_display = "none"
			
			@message = "Access granted"
			
			@logbook = File.read("public/logbook.txt")
			
			erb :logbook
			
		else
			
			@message = "Access denied"
			
			erb :admin
		
		end	
	

	
end