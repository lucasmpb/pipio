require 'gosu'
require 'singleton'
require_relative 'state'

# Main game
class GameWindow < Gosu::Window
  SCREEN_WIDHT = 800
  SCREEN_HEIGHT = 600

  def initialize
    super SCREEN_WIDHT, SCREEN_HEIGHT
    self.caption = 'Pi-Pio'

    State.instance.new_state(:start)
  end

  def update
    State.instance.object.update
  end

  def draw
    self.caption = "Pi-Pio #{State.instance.state}"

    State.instance.object.draw
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
