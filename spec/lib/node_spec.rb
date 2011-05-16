require 'spec_helper'

describe Node do
  context "A new node" do
    subject { Node.new }

    it "should be able to be initialized" do
      lambda{ Node.new }.should_not raise_error
    end

    it "should raise if scene accessed when not added to a scene" do
      lambda{ subject.scene }.should raise_error(NoSceneError)
    end

    context "added to a scene" do
      let(:scene){ Scene.new }

      it "should know the scene it was added to" do
        scene.add_node(subject)
        subject.scene.should be scene
      end
    end
  end
end
