require 'sinatra'
require_relative 'isbn.rb'

enable :sessions

get '/' do
  isbn_check = session[:check] || ''
  erb :layout, locals: {isbn_check: isbn_check}
end

post '/check_isbn' do
  isbn = params[:isbn]
  temp = isbn(isbn)
  isbn_str = ''
  if temp == true
    isbn_str += "Valid"
  else
    isbn_str += "Invalid"
  end
  session[:check] = isbn_str
  redirect '/'
end