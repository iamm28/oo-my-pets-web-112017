class Owner
  # code goes here
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets
  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {fishes:[],dogs:[],cats:[]}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |animal,arr|
      arr.each do |one_pet|
        one_pet.mood = "nervous"
      end
    end
    @pets = {fishes:[],dogs:[],cats:[]}
  end

  def list_pets
    str = "I have"
    self.pets.each do |animal,arr|
      str << " #{arr.length} #{animal},"
    end
    return str
  end
end
