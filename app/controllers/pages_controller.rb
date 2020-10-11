class PagesController < ApplicationController
  def home
    @random_url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    random_serialized = open(@random_url).read
    random_parsed = JSON.parse(random_serialized)
    @random = random_parsed["drinks"][0]
  end

  def index 
    require 'json'
    require 'open-uri'
    
    @url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{params[:letter]}"
    letter_serialized = open(@url).read
    letter_parsed = JSON.parse(letter_serialized)
    @letter_cocktails = letter_parsed["drinks"]

    @random_url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    random_serialized = open(@random_url).read
    random_parsed = JSON.parse(random_serialized)
    @random = random_parsed["drinks"][0]
  end

  def show
    @random_url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    random_serialized = open(@random_url).read
    random_parsed = JSON.parse(random_serialized)
    @random = random_parsed["drinks"][0]

    @url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:id]}"
    cocktail_serialized = open(@url).read
    cocktail_parsed = JSON.parse(cocktail_serialized)
    @cocktail = cocktail_parsed["drinks"][0]
    
    all_ingredients = @cocktail.select {|key, value| key.match(/^strIngredient\d+/)}
    ing_rej = all_ingredients.reject {|key, value| value.nil? }
    @ingredients = ing_rej.values

    all_doses = @cocktail.select {|key, value| key.match(/^strMeasure\d+/)} 
    doses_rej = all_doses.reject {|key, value| value.nil? || value.empty? }
    @doses = doses_rej.values
  
    @measured_ing = @doses.zip(@ingredients)
  end

  private 

  def cocktail_params
    params.require(:pages).permit(:category)
  end
end