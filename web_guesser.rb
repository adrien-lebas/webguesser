require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(100)

get '/' do
    guess = params["guess"].to_i
    if guess > secret_number
        message = "too high"
        secret_number_display = "?"
    elsif guess < secret_number
        message = "too low"
        secret_number_display = "?"
    elsif guess == secret_number
        message = "correct"
        secret_number_display = secret_number
    end
    if (guess - secret_number).abs >=5
        message = "way " + message
    end
    erb :index, :locals => {:secret_number => secret_number_display, :message => message}
end