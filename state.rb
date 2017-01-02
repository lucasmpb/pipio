require_relative 'states/start'
require_relative 'states/gameplay'

# State
class State
  include Singleton

  STATES = {
    start: 'START',
    gameplay: 'GAMEPLAY',
    win: 'WIN',
    loose: 'LOOSE'
  }.freeze

  attr_accessor :state, :object

  def new_state(state)
    tap do |me|
      me.state = state
      me.object = case state
                  when :start
                    States::Start.new
                  when :gameplay
                    States::Gameplay.new
                  when :win
                  when :loose
                  end
    end
  end
end
