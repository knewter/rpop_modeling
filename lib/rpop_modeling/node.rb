module RPopModeling
  # Node
  # ----
  # A Node is an object on a Scene that has an execution-per-loop.
  # It is meant to be subclassed by all of the interesting classes
  # in your models.
  class Node
    attr_accessor :data, :lambda

    def initialize
      @data = {}
      @lambda = nil
    end

    # Access the scene this node was added to
    def scene
      @scene || raise(NoSceneError)
    end

    # Set the scene for this node
    def scene= scene
      @scene = scene
    end

    # This is a convenience method to set up a block
    # in this node's context.
    def setup_lambda &block
      @lambda = block
    end

    def step!
      @lambda.call(self)
    end
  end
end
