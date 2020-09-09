class PagesController < ApplicationController
  def home
    require 'json'
    require 'open-uri'

    @url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    cocktail_serialized = open(@url).read
    cocktail_parsed = JSON.parse(cocktail_serialized)
    @cocktails = cocktail_parsed["drinks"]
  end

  def index 
    require 'json'
    require 'open-uri'
    
    @url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{params[:letter]}"
    cocktail_serialized = open(@url).read
    cocktail_parsed = JSON.parse(cocktail_serialized)
    @cocktails = cocktail_parsed["drinks"]
  end

  def show
    @url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:drink_id]}"
    cocktail_serialized = open(@url).read
    cocktail_parsed = JSON.parse(cocktail_serialized)
    @cocktail = cocktail_parsed["drinks"]
  end
end
