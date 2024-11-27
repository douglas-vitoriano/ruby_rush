require 'rubygems'
require 'gosu'
require 'json'

require_relative 'utils/lang'

require_relative 'models/state'
require_relative 'models/player'
require_relative 'models/car'
require_relative 'models/road'
require_relative 'models/speedometer'

require_relative 'states/menu_state'
require_relative 'states/game_state'

require_relative 'states/menu_states/main'
require_relative 'states/menu_states/scenario'
require_relative 'states/menu_states/highscores'
require_relative 'states/menu_states/garage'
require_relative 'states/menu_states/options'

require_relative 'states/game_states/oneway'
require_relative 'states/game_states/twoway'
