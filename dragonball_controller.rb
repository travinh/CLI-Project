
require_relative "dragonball_char"
require_relative "dragonball_planet"

require_relative "dragonball_api"


class DragonBallController

    def getinfo
        API.new.start
    end

    def menu
        

        puts "Welcome to Dragon Ball World"
        puts "1. To list all of characters, enter 'list characters'."
        puts "2. To list all of planets enter 'list planets'."
        puts "3. To quit, type 'exit'."
        puts "What would you like to do?"  
          
    end

    def menu_char
        puts "Please type the name of the character that you want to know"
    end

    def menu_planet
        puts "Please type the name of the planet that you want to know"
    end

    def call 
        getinfo
        menu
        input = gets.chomp 

        while input != "exit"
            if input == "list characters"
                Character.all
                menu
                input = gets.chomp  
            elsif input == 'list planets'
                Planet.all
                menu
                input = gets.chomp            
            else
                menu
                input = gets.chomp 
            end
        end

        
    
    end
end

DragonBallController.new.call