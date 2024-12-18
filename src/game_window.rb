class GameWindow < Gosu::Window
  attr_accessor :state
  attr_reader :data, :lang

  def initialize
    super Path::WIDTH, Path::HEIGHT
    self.caption = 'Racing'
    self.resizable = false 
    @states = [
      MainMenuState, ScenarioMenuState, HighScoresMenuState, GarageMenuState,
      OptionsMenuState, OneWayGameState, TwoWayGameState
    ]
    @state = 0
    @last_state = @state
    load_metadata
    @current_state = @states[@state].new(main: self)
  end

  def load_metadata
    @data = JSON.parse(File.read(Path::DATA + 'data.json'))
    @lang = Lang.new(main: self, lang: @data['config']['language'])
    @is_sound_enable = @data['config']['sound']
    @is_countdown_enable = @data['config']['countdown']
  end

  def update
    if @state != @last_state
      @current_state = @states[@state].new(main: self)
      @last_state = @state
    end
    @current_state.update
  end

  def draw
    @current_state.draw
  end

  def button_down(id)
    @current_state.button_down(id)
  end

  def play_sound(song, looping = false, volume = 1.0, speed = 1.0)
    if song.is_a? Gosu::Song
      song.play(looping) if @is_sound_enable
    elsif @is_sound_enable
      song.play(volume, speed, looping)
    end
  end

  def toggle_music(song = Nil, looping = false)
    @is_sound_enable = !@is_sound_enable
    if song
      if @is_sound_enable
        play_sound(song, looping)
      else
        song.stop
      end
    end
  end

  def toggle_countdown
    @is_countdown_enable = !@is_countdown_enable
    @data['config']['countdown'] = @is_countdown_enable
  end

  def sound_label
    @lang['options_sound'][@is_sound_enable ? 0 : 1]
  end

  def countdown_label
    @lang['options_countdown'][@is_countdown_enable ? 0 : 1]
  end

  def current_difficulty
    difficulty =
      @data['config']['difficulty'][@data['config']['current_difficulty']]
    {
      difficulty: @data['config']['current_difficulty'],
      cars_wave: difficulty['cars_wave'],
      cars_move: difficulty['cars_move'],
      score_factor: difficulty['score_factor']
    }
  end

  def restart
    @current_state = @states[@state].new(main: self)
  end

  def close
    @data['config']['sound'] = @is_sound_enable
    @data['config']['countdown'] = @is_countdown_enable
    File.open(Path::DATA + 'data.json', 'w') do |f|
      f.write(@data.to_json)
    end
    super
  end
end
