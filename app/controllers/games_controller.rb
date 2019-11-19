require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:games]}"
    content = open(url).read
    word = JSON.parse(content)
    worddd = word['found']
    if worddd == true
      if params[:games].chars.all? do |letter|
        params[:games].count(letter) <= params[:letters].count(letter)
      end
        @score = 'welldone !'
      else
        @score = 'word cannot be built from the letters in the sample'
      end
    else
      @score = 'The word does not exist'
    end
  end
end
