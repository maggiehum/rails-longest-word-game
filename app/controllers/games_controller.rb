require 'json'
require 'open-uri'


class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
    # @letters = @letters.sample(10)
  end

  def score
    @letters = params[:letters]
    @answer = params[:answer]

    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    json = URI.open(url).read
    response_hash = JSON.parse(json)

    # raise

    @output = if response_hash['found'] == true
                'good'
              else
                "Sorry #{@answer} does not seem to be a valid english word..."
              end
    # if @answer.include?(@letters)
    #   'good'
    # end
  end
end
