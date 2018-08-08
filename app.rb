require 'sinatra'
require_relative 'isbn.rb'

enable :sessions

get '/' do
  isbn_check = session[:check] || []
  isbn_holder = session[:isbn] || []
  erb :layout, locals: {isbn_check: isbn_check, isbn_holder: isbn_holder}
end

post '/check_isbn' do
  isbn = params[:isbn]
  stored_isbn = params[:stored_isbn] || []
  isbn_str = params[:isbn_str] || []
  stored_isbn << isbn
  temp = isbn_refa3(isbn)
  if temp == true
    temp = "Valid"
  elsif temp == false
    temp = "Invalid"
  end
  isbn_str << temp
  session[:check] = isbn_str
  session[:isbn] = stored_isbn
  redirect '/'
end