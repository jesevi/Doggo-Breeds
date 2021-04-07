class CLI

    def initialize
        API.new.get_breed_data
    end
    
    def call
        greeting
        menu
    end

    def greeting
        puts "Welcome! My name is Roofus! the cyber dog, I know lots about dog breeds!"
        puts ""
        puts "To search for your favorite or any dog breeds, type 'breeds'"
        puts ""
        puts "When you are done type 'done' and hope you have a great day!"
    end   

    def menu
        input = gets.strip.downcase
        
        if input == "breeds"
            list_of_breeds
        elsif input == "done"
            goodbye
        elsif input == "lets go for a walk"
            goodbye
        else
            invalid_entry
        end
    end


    def goodbye
        puts "Goodbye! enjoy your walk! and dont forget to give your dog a treat for being the goodest boy or girl!"
    end 
   

    def list_of_breeds
        puts "Nice! which breed you would like to know about?"
        DogBreed.all.each_with_index do |breed, index|
            puts "#{index + 1}. #{breed.name}"
        end
        input = gets.strip.downcase
        breed_selection(input)
    end


    def breed_selection(breed)
        #input = gets.strip.downcase
        breed = DogBreed.find_by_name(breed) 
        if breed
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Name of Breed: #{breed.name}"
            puts "Approximate Weight: #{breed.get_metric_weight}"
            puts "Approximate Height: #{breed.get_metric_height}"
            puts "Bred For: #{breed.bred_for}"
            puts "Breed Group: #{breed.breed_group}"
            puts "Average Life Span: #{breed.life_span}"
            puts "Temperament: #{breed.temperament}"
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts ""
            puts "If you want to look at more breeds, type 'breeds'."
            puts "If you are done here, type 'lets go for a walk'."
            puts ""
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            menu
        else
            incorrect_breed_name
        end
    end


    def incorrect_breed_name
        puts "Ruh Roh. The breed name that you entered may not exist...yet! let's try that again"
        puts "Please type 'breeds' to pull up the list and we'll try again!"
        menu
    end


    def invalid_entry
        puts ""
        puts "Woof, I'm not understanding, let's try that again."
        puts ""
        menu
    end

    #binding.pry


end