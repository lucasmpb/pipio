# Start Screen
module States
  class Start
    TEXT_SPEED = 3

    def initialize
      @background_image = Gosu::Image.new('assets/backgrounds/start.jpg', tileable: true)
      @font = Gosu::Font.new(20)

      @text_position = GameWindow::SCREEN_WIDHT + 20
    end

    def update
      State.instance.new_state(:gameplay) if Gosu.button_down? Gosu::KbReturn

      @text_position -= TEXT_SPEED
      @text_position = GameWindow::SCREEN_WIDHT + 20 if @text_position < -250
    end

    def draw
      @background_image.draw(0, 0, 0)

      @font.draw('Presione "intro" para jugar', @text_position, GameWindow::SCREEN_HEIGHT * 0.8, 1, 1, 1, Gosu::Color::BLUE)
    end
  end
end
