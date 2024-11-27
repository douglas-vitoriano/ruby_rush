class State
  def initialize(options = {})
    @main = options[:main]
  end

  def update
    raise NotImplementedError, 'This is not allowed!'
  end

  def draw
    raise NotImplementedError, 'This is not allowed'
  end

  def button_down(_id)
    raise NotImplementedError, 'This is not allowed'
  end
end
