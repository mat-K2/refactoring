class Post
  attr_accessor :state

  def self.states(*args)
    args.each do |arg|
      define_method arg do
        self.state = arg
      end
    end
  end

  states :failure, :error, :success
end
