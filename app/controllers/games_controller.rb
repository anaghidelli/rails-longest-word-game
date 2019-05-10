require 'open-uri'
require 'json'
# frozen_string_literal: true

# this is a class for my games controller
class GamesController < ApplicationController
  def new
    @letters = Array.new(9) { [*'A'..'Z'].sample }.join(' ')
  end

  def score
    @guess = params[:guess].split('')


      url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
      response = open(url).read
      response = JSON.parse(response)

      if @guess.all? { |e| @letters.include?(e) }
        "Sorry, but #{@guess} can't built out of @letters"
      elsif response[:found] == false
        "Sorry, but #{@guess} does not seem to be a valid english word"
      else
        "Congratulations! #{@guess} is a valid english word"
      end

  end
end
