module RPopModeling
  # Scene
  # -----
  # A Scene is a parent object that holds a collection of nodes
  # and manages their lifecycle.
  class Scene
    attr_accessor :nodes, :step, :series_data

    def initialize
      @nodes = []
      @step = 0
      # Series data is an array which has a hash added to it for each step
      # of the scene.  This can be used to store data, for instance if you want
      # to graph population growth.
      @series_data = []
      @series_data_collector = lambda do |n|
        return {}
      end
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
      add_series_data(@series_data_collector.call(self))
      @step += 1
      nodes.clone.each do |n|
        n.step!
      end
    end

    def setup_series_data_collector &block
      @series_data_collector = block
    end

    def add_series_data(hash)
      @series_data << hash
    end
  end
end
