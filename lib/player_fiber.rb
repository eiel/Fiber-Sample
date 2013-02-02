require 'curses'

class PlayerFiber
  def initialize
    @x = 5
    @y = 5
  end

  def step
    fiber.resume
  end

  def fiber
    @fiber ||= Fiber.new do
      loop do
        @x = 5
        @y = 5

        10.times do
          @x += 1
          Fiber.yield
        end

        10.times do
          @y += 1
          Fiber.yield
        end

        10.times do
          @x -= 1
          Fiber.yield
        end

        10.times do
          @y -= 1
          Fiber.yield
        end
      end
    end
  end

  def draw
    Curses.setpos(@x,@y)
    Curses.addstr('*')
  end
end
