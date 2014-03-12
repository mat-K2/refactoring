class Person
  def found_friends(people)
    friends = []
    people.each do |person|
      if person == 'Don'
        friends << person
      end
      if person == 'John'
        friends << person
      end
      if person == 'Kent'
        friends << person
      end
    end
    return friends
  end
end
