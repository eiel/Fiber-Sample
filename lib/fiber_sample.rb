require 'curses'
require 'player'
require 'player_fiber'

class FiberSample
  def self.start(player)
    Curses.init_screen
    begin
      loop do
        Curses.clear
        player.step
        player.draw
        Curses.setpos(60,80)
        Curses.refresh
        sleep(0.2)
      end
    ensure
      Curses.close_screen
    end
  end
end
