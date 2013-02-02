require 'curses'

class Player
  def initialize
    @time = 0
    @x = 5
    @y = 5
  end

  def step
    if @time < 10
      @x += 1
    elsif @time >=10 and @time < 20
      @y += 1
    elsif @time >= 20 and @time < 30
      @x -= 1
    elsif @time >= 30 and @time < 40
      @y -= 1
    else
      @x = 0
      @y = 0
      @time = 0
    end
    @time += 1
  end

  def draw
    Curses.setpos(@x,@y)
    Curses.addstr('*')
  end
end
