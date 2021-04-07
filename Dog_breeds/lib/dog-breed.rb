class DogBreed

    @@all = []

    def initialize(breed_hash)
        breed_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

   
    #binding.pry

    def self.find_by_name(name)
        self.all.find do |breed|
            breed.name.downcase == name
        end
    end

    def get_metric_weight
        self.weight["metric"] + " lbs"
    end

    def get_metric_height
        self.height["metric"] + " cm"
    end



end