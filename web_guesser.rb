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

get '/' do
  guess   = params["guess"]
  message = check(guess.to_i)
  erb :index, locals: {number: settings.number, message: message}
end
