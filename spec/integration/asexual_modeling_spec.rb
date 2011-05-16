require 'spec_helper'

describe "AsexualOrganism integration spec" do
  context "A scene with an asexual organism reproducing half of the time" do
    let(:node) { AsexualOrganism.new }
    let(:scene){ Scene.new }
    before(:all) do
      node.reproduction_rate = 0.5
      scene.add_node(node)
    end

    it "should create around 100 organisms in 10 steps" do
      10.times do
        scene.step!
      end

      # LOL this won't pass....most of the time.
      scene.nodes.count.should be_within(20).of(100)
    end
  end
end
