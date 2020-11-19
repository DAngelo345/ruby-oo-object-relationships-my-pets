class Owner

  attr_accessor 
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    
  end
  
  def self.all
    @@all 
  end
  
  def say_species
     return "I am a #{species}."
  end
  
  def self.count
    self.all.size
  end

  def self.reset_all
      self.all.clear
  end

  def cats
      Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
      Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
     Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
      dogs.each do |dog|
        dog.mood = "happy"
      end
  end
  
  def feed_cats
      cats.each do |cat|
        cat.mood = "happy"
      end
  end

  def sell_pets
      pets = self.cats + self.dogs
      pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
      end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end
end