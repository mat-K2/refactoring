class Person
  def self.attrs_with_empty_predicate(*args)
    attr_accessor :name, :age

    args.each do |attribute|
      define_method "empty_#{attribute}?" do
        self.send(attribute).nil?
      end
    end
  end

  attrs_with_empty_predicate :name, :age

end
