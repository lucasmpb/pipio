require 'gosu'
require 'singleton'
require_relative 'state'
require_relative 'states/start'
require_relative 'states/gameplay'

# Main game
class GameWindow < Gosu::Window
  SCREEN_WIDHT = 800
  SCREEN_HEIGHT = 600

  def initialize
    super SCREEN_WIDHT, SCREEN_HEIGHT
    self.caption = 'Pi-Pio'

    @font = Gosu::Font.new(20)

    State.instance.new_state(:start)
  end

  def update
    State.instance.object.update
    case State.instance.state
    when :start

    when :gameplay
    when :win
    when :loose
    end
  end

  def draw
    self.caption = "Pi-Pio #{State.instance.state}"
    @font.draw('Hello World', SCREEN_WIDHT / 2, SCREEN_HEIGHT / 2, 0)
  end

  def button_down(id)
    case State.instance.state
    when :gameplay
      State.instance.new_state(:start) if id == Gosu::KbEscape
    else
      close if id == Gosu::KbEscape
    end
  end
end

window = GameWindow.new
window.show
