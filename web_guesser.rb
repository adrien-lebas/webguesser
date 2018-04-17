require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(100)
background_color = "red"
opacity = 0

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
        opacity = 0
        background_color = "green"
    end
    if (guess - secret_number).abs >=5
        message = "way " + message
        opacity = 1
    else opacity = 0.5
    end
    erb :index, :locals => {
        :secret_number => secret_number_display,
        :message => message,
        :opacity => opacity,
        :background_color => background_color}
end