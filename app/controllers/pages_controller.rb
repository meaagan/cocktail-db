class PagesController < ApplicationController
  def home
    require 'json'
    require 'open-uri'

    @url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    letter_serialized = open(@url).read
    letter_parsed = JSON.parse(letter_serialized)
    @letter_cocktails = letter_parsed["drinks"]

    @categories = ["Ordinary Drink","Cocktail","Milk / Float / Shake","Other/Unknown","Cocoa","Shot","Coffee / Tea","Homemade Liqueur","Punch / Party Drink","Beer","Soft Drink / Soda"]
    # @category_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=#{params[:category]}"
    # category_serialized = open(@category_url).read
    # category_parsed = JSON.parse(category_serialized)
    # @category_cocktails = category_parsed["drinks"]
  end

  def index 
    require 'json'
    require 'open-uri'
    
    @url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{params[:letter]}"
    letter_serialized = open(@url).read
    letter_parsed = JSON.parse(letter_serialized)
    @letter_cocktails = letter_parsed["drinks"]
  end

  def show
    @url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:drink_id]}"
    cocktail_serialized = open(@url).read
    cocktail_parsed = JSON.parse(cocktail_serialized)
    @cocktail = cocktail_parsed["drinks"]
  end

  private 

  def cocktail_params
    params.require(:pages).permit(:category)
  end
end
