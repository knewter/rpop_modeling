require 'spec_helper'

describe Scene do
  context "A new scene" do
    subject { Scene.new }

    it "should be able to be initialized" do
      lambda{ Scene.new }.should_not raise_error
    end

    context "stepping through" do
      it "should know what step it's on" do
        subject.step.should == 0
        subject.step!
        subject.step.should == 1
      end

      it "should step through each node once per step" do
        node = Node.new
        node.setup_lambda do |n|
          n.data[:foo] = 'bar'
        end
        subject.add_node node
        subject.step!
        node.data[:foo].should == 'bar'
      end
    end

    context "working with nodes" do
      let(:node){ Node.new }

      it "should be able to have nodes added to it" do
        subject.add_node(node)
        subject.nodes.include?(node).should be true
      end
    end
  end
end
