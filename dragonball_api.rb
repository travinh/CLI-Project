require "pry"

require "rest-client"
require "json"

require_relative "dragonball_char"
require_relative "dragonball_planet"
# class Dragonball_API 

#     def initialize
#     end
#     def getapi
        dragonball_url = "https://dragon-ball-api.herokuapp.com"

        resp = RestClient.get("https://dragon-ball-api.herokuapp.com/api/")
        dragonball_array = JSON.parse(resp.body, symbolize_names:true)


#         # get information for characters and planet
        characters_array = JSON.parse(RestClient.get(dragonball_array[:characters]).body, symbolize_names:true)
        planets_array = JSON.parse(RestClient.get(dragonball_array[:planets]).body, symbolize_names:true)

        characters_array.each do |character|
            character_url = dragonball_url + character[:url]
            Character.new(character[:name], character_url)
        
        end

        Character.all.each do |character_inst|
            character = JSON.parse(RestClient.get(character_inst.url),symbolize_names:true)
            character_inst.id = character[:id]
            character_inst.originPlanet = character[:originPlanet]
            character_inst.status = character[:status]
            character_inst.gender = character[:gender]

        end


        planets_array.each do |planet|
            planet_url = dragonball_url + planet[:url]
            Planet.new(planet[:name], planet_url)
        end

        Planet.all.each do |planet_inst|
            planet = JSON.parse(RestClient.get(planet_inst.url), symbolize_names:true)
            planet_inst.characters = planet[:residents]
        end



        binding.pry

        true
#     end

#     # def plus
#     #     1+1
#     # end
# end

# Dragonball_API.new.getapi






# binding.pry
# true



# characters
# binding.pry 



# get url : hash[:characters], hash[:planets]