module Path
  SOURCE = File.dirname(__FILE__).freeze
  FONTS =  File.join(SOURCE, 'media/fonts/').freeze
  IMAGES = File.join(SOURCE, 'media/images/').freeze
  SOUNDS = File.join(SOURCE, 'media/sounds/').freeze
  DATA = File.join(SOURCE, 'data/').freeze
  LANGS = File.join(SOURCE, 'langs/').freeze

  WIDTH = 512
  HEIGHT = 512
  
  CARS = [
    [Path::IMAGES + 'car.png', nil],
    [Path::IMAGES + 'ambulance.png', Path::SOUNDS + 'ambulance.wav'],
    [Path::IMAGES + 'audi.png', nil],
    [Path::IMAGES + 'black_viper.png', nil],
    [Path::IMAGES + 'mini_truck.png', nil],
    [Path::IMAGES + 'mini_van.png', nil],
    [Path::IMAGES + 'police.png', Path::SOUNDS + 'police.wav'],
    [Path::IMAGES + 'taxi.png', nil]
  ].freeze
end
