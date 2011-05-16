require 'spec_helper'

describe AsexualOrganism do
  context "A new asexual organism" do
    subject { AsexualOrganism.new }

    it "should be able to be initialized" do
      lambda{ AsexualOrganism.new }.should_not raise_error
    end

    context "added to a scene" do
      let(:scene){ Scene.new }
      before(:each) do
        scene.add_node(subject)
      end

      it "should reproduce each step" do
        # We have to set the reproduction rate to 1 to guarantee this
        subject.reproduction_rate = 1
        scene.step!
        scene.nodes.count.should == 2
      end
    end
  end
end
