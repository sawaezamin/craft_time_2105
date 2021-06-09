class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new() # same as {}
  end

  def add_supply(name, quantity)

    if !@supplies.key?(name)
      @supplies[name] = quantity
    else
      @supplies[name] += quantity
    end
  end

  def can_build?(craft)

    result = false
    supply_count = 0
    craft.supplies_required.each do |supply, min_quantity|
      supply = supply.to_s

      if @supplies.key?(supply) && supplies[supply] >= min_quantity
        supply_count += 1
      end
    end
    if supply_count == craft.supplies_required.length
      result = true
    end
    result
  end
end
