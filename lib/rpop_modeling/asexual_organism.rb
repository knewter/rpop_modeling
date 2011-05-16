module RPopModeling
  # AsexualOrganism
  # ---------------
  # An AsexualOrganism just reproduces 1 * reproduction_rate per cycle.
  class AsexualOrganism < Node
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
end
