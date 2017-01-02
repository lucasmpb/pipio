require 'gosu'

class GameWindow < Gosu::Window
  SCREEN_WIDHT = 800
  SCREEN_HEIGHT = 600

  def initialize
    super SCREEN_WIDHT, SCREEN_HEIGHT
    self.caption = "Pi-Pio"

    @font = Gosu::Font.new(20)
  end

  def update

  end

  def draw
    @font.draw("Hello World", SCREEN_WIDHT / 2, SCREEN_HEIGHT / 2, 0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
