require 'domain/bean'
require 'domain/hand'
require 'domain/jars'

class Game

  attr_reader :hand, :jars, :turn

  BEAN_COLOURS = Set.new(
    [:red, :green, :blue, :yellow, :black]
  )
  BEANS_PER_COLOUR = 6

  def initialize
    @turn = 1
    @hand = Hand.new
    @jars = Jars.new(BEAN_COLOURS.length)
    @jars.last.add_beans(BEAN_COLOURS.map { |colour|
      Array.new(BEANS_PER_COLOUR) { Bean.new(colour) }
    }.flatten)
  end

  def take_bean_from(jar)
    hand.take_bean_from(jar)
  end

  def put_bean_into(jar)
    ret = hand.put_bean_into(jar)
    @turn = @turn + 1 if ret
    ret
  end

  def pass
    @turn = @turn + 1
  end

end
