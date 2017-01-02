# Start Screen
module States
  class Start
    def initialize
    end

    def update
      State.instance.new_state(:gameplay) if Gosu.button_down? Gosu::KbReturn
    end

    def draw
    end
  end
end
