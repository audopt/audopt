class Pet < ActiveRecord::Base
  validates_inclusion_of :singleton_guard, :in => [0]

  def self.instance
    begin
      find(1)
    rescue ActiveRecord::RecordNotFound
      pet = Pet.new
      pet.singleton_guard = 0
      pet.save
      pet
    end
  end

  def self.increase
    pet = Pet.find(1)
    pet.qtd = pet.qtd + 1
    pet.save
  end

end
