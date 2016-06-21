require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess, settings.number)
  erb :index, :locals => {:number => settings.number, :message => message, :guess => guess}
end

def check_guess(guess, number)
  if guess == nil
    "Guess the SECRET NUMBER!"
  elsif guess.to_i > number + 5
    "WAY Too High!"
  elsif guess.to_i > number
    "Too High!"
  elsif guess.to_i < number - 5
    "WAY Too Low!"
  elsif guess.to_i < number
    "Too Low!"
  else
    "You guessed it!<br><br>the SECRET NUMBER is #{number}!"
  end
end
