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

get '/contactus' do
	erb :contactus
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

post '/contactus' do

@name = params[:name]
@text = params[:text]

error_message = {
:name => "Enter your name",
:text => "Enter your message"
}

@error = error_message.select{|key,value| params[key] == ''}.values.join(", ")

if @error != ''
	erb :contactus

else

erb "Your message was sent"

end




end