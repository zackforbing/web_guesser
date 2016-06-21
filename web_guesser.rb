require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess, settings.number)
  color = bg_color_indicator(guess, settings.number)
  erb :index, :locals => {:number => settings.number, :message => message,
    :color => color}
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

  def bg_color_indicator(guess, number)
    if guess == nil
      "background: white"
    elsif guess.to_i > number + 5
      "background: red"
    elsif guess.to_i > number
      "background: coral"
    elsif guess.to_i < number - 5
      "background: red"
    elsif guess.to_i < number
      "background: coral"
    else
      "background: green"
    end
  end
