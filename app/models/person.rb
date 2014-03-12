class Person
  def found_friends(people)
    people.select { |person| %w(Don John Kent).include?(person) }
  end
end
