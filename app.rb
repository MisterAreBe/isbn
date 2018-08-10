require 'sinatra'
require_relative 'isbn.rb'

enable :sessions

get '/' do
  isbn_check = session[:isbn_holder] || []
  erb :layout, locals: {isbn_check: isbn_check}
end

post '/check_isbn' do
  isbn = params[:isbn]
  stored_isbn = params[:stored_isbn] || []
  isbn_str = params[:isbn_str] || []
  x = isbn.split("\r\n")
  x.each do |v|
    if v != nil
      stored_isbn << v
    else
      stored_isbn << ""
    end
    if isbn_refa3(v)
      isbn_str << "Valid"
    else
      isbn_str << "Invalid"
    end
  end
  isbn_check = []
  isbn_str.each_with_index do |v,i|
    isbn_check << [stored_isbn[i], v]
  end
  session[:isbn_holder] = isbn_check
  redirect '/'
end