require_relative 'requires'
require_relative 'z_order'
require_relative 'path'
require_relative 'game_window'

module Racing
  module_function

  def open
    window = GameWindow.new
    window.show
  end
end
