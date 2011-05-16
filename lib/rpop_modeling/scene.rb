module RPopModeling
  # Scene
  # -----
  # A Scene is a parent object that holds a collection of nodes
  # and manages their lifecycle.
  class Scene
    attr_accessor :nodes, :step

    def initialize
      @nodes = []
      @step = 0
    end

    # You can add a node to a scene.  This just helps the scene know
    # which objects it should be concerned with.
    def add_node node
      nodes << node
      node.scene = self
    end

    # step! will iterate over a scene's lifecycle by a single unit.
    # Each node in the scene will be sent step! once as well.
    def step!
      @step += 1
      nodes.each do |n|
        n.step!
      end
    end
  end
end
