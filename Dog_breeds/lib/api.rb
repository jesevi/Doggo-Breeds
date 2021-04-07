class API

    def initialize
        @url = "https://api.thedogapi.com/v1/breeds"
    end

    def get_breed_data
        breed_hash = HTTParty.get(@url)
        breed_array = breed_hash
        self.create_breed_objects(breed_array)
    end

    def create_breed_objects(breed_array)
        breed_array.each do |breed_hash|
            DogBreed.new(breed_hash)
        end
    end



end