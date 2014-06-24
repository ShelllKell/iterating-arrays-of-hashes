class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
    end


  # only edit below this line

  def small_dogs

    @dogs.select { |dog| dog[:size] == :small}

  #   small_dogs = []
  #   @dogs.each do |dog|
  #     if dog[:size] == :small
  #       small_dogs.push({name: dog[:name]})
  #     end
  #   end
  # small_dogs
  end

  def huge_dog
    huge_dogs = []
    @dogs.each do |dog|
      if dog[:size] == :huge
        huge_dogs.push({name: dog[:name]})
      end
    end
    huge_dogs
  end

  def large_dog_names
    large_dogs = []
    @dogs.each do |dog|
      if dog[:size] == :large
        large_dogs.push(dog[:name])
      end
    end
    large_dogs
  end

  def joes_large_dogs
    large_dogs = []
    @dogs.each do |dog|

      if dog[:owner][:name][:first] == "Joe"
        if dog[:size] == :large
            large_dogs.push(dog[:name])
        end
      end
     end
    large_dogs
  end

  def sizes
    sizes = []
    @dogs.each do |dog|
     sizes.push(dog[:size])
    end
    sizes.uniq

  end

  def owners
    owners = []
    @dogs.each do |dog|
      owners.push(dog[:owner][:name][:first] +" "+ dog[:owner][:name][:last])
    end
     owners.uniq
  end

  def average_owners
    avg_owners = []
    @dogs.each do |dog|
      if dog[:owner][:owner_quality] == AVERAGE
        avg_owners.push(dog[:owner][:name][:first] +" "+ dog[:owner][:name][:last])
      end

    end
    avg_owners.uniq
  end

  def to_s
    owners = [[],[],[]]
    @dogs.each do |dog|
      if dog[:owner][:name][:first] == "Joe"
        owners[0].push(dog[:name])
      elsif dog[:owner][:name][:first] == "Sarah"
        owners[1].push(dog[:name])
      else
        owners[2].push(dog[:name])
      end
    end
    str = "Joe owns: #{owners[0][0]}, #{owners[0][1]}, and #{owners[0][2]}\nSarah owns: #{owners[1][0]} and #{owners[1][1]}\nAndrew owns: #{owners[2][0]} and #{owners[2][1]}"

  end

  def find_by_owner(name)

      find_owner = []
      @dogs.each do |dog|
        owner = dog[:owner][:name].values
        if dog[:owner][:name][:first] == name
          find_owner.push({name: dog[:name]})
        elsif dog[:owner][:name][:last] == name
          find_owner.push({name: dog[:name]})
        elsif owner[0] + " " + owner[1] == name
          find_owner.push({name: dog[:name]})

        end
      end

    p find_owner

  end



end
