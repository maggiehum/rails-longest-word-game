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

    # @letter.split(' ')
    valid = true
    @answer.split('').each do |letter|
      unless (@letters.split(' ')).include?(letter)
        valid = false
      end
    end

    @output = if valid == false
                "Sorry but #{@answer} can't be built out of #{@letters}"
              elsif response_hash['found'] == true && valid == true
                "Congratulatons! #{@answer} is a valid english word!"
              else
                "Sorry #{@answer} does not seem to be a valid english word..."
              end
    # if @answer.include?(@letters)
    #   'good'
    # end
  end
end
