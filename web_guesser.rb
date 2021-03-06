require 'sinatra'
require 'sinatra/reloader'

set :number, rand(0..100)


def check(guess)
  if guess > (settings.number + 5)
    "Way too High!"
  elsif guess < (settings.number - 5)
    "Way too low!"
  elsif guess > settings.number
    "Too high!"
  elsif guess < settings.number
    "Too low!"
  else
    "You got it right!"
  end
end

def background(message)
  if message == "Way too High!" || message == "Way too low!"
    "#de1738"
  elsif message == "Too high!" || message == "Too low!"
    "#ffdbe0"
  elsif message == "You got it right!"
    "#32cd32"
  else
    "white"
  end
end

get '/' do
  guess   = params["guess"]
  message = check(guess.to_i)
  background = background(message)
  erb :index, locals: {number: settings.number, message: message, background: background}
end
