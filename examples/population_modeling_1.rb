$:.unshift File.join(__FILE__, '..', 'lib')
require 'rpop_modeling'
include RPopModeling

class Person < Node
  attr_accessor :reproduction_rate

  def initialize
    super
    @reproduction_rate = 0
    setup_lambda do |n|
      if rand <= reproduction_rate
        n.scene.add_node(self.dup)
      end
    end
  end
end

class PopulationModeling1
  def initialize
    @scene = Scene.new
    @adam = Person.new
    @eve  = Person.new
    @scene.add_node(@adam)
    @scene.add_node(@eve)
  end

  def run!
    100.times do
      @scene.step!
    end
  end
end

p = PopulationModeling1.new
p.run!
