class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |person|
      person.name
    end
  end

  def craft_with_most_supplies
    temp_craft = @crafts.max_by do |craft|
      craft.supplies_required.keys.length
    end
    temp_craft.name
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      supply_list << craft.supplies_required.keys
    end
    supply_list = supply_list.flatten.uniq
    supply_list.map do |supply|
      supply.to_s
    end 
  end
end
