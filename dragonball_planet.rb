class Planet

    attr_accessor :name, :characters, :url

    @@all = []

    def initialize(name,url)
        @name = name 
        @url = url 
        @@all << self if !@@all.include?(self)

    end

    def self.all 
        @@all 
    end

    def self.delete 
        @@all.clear
    end




end