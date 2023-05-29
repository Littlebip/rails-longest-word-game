require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    charset = ('A'..'Z').to_a
    @letters = Array.new(10) { charset.sample }
  end

  def score
    @set = params[:array_of_letters].chars
    @trial = params[:word].upcase.chars
    if trial_existence_checker(params[:word]) == false
      @results = "Sorry but #{params[:word].upcase} does not seem to be a valid English word..."
    elsif trial_in_set_checker(@trial, @set) == false
      @results = "Sorry but #{params[:word].upcase} can't be build out of #{params[:array_of_letters]}"
    else
      @results = "Congratulations! #{params[:word].upcase} is a valid English word!"
    end
  end

  def trial_in_set_checker(trial, set)
    trial.each do |letter|
      if set.include? letter
        trial.delete_at(trial.find_index(letter))
        set.delete_at(set.find_index(letter))
      else
        return false
      end
    end
    true
  end

  def trial_existence_checker(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    check_string = URI.open(url).read
    check_hash = JSON.parse(check_string)
    check_hash['found']
  end
end
