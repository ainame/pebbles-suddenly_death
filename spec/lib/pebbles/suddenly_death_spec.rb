require 'pebbles/suddenly_death'

describe Pebbles::SuddenlyDeath do
  before(:each) do
    class Dummy
      def instance_method_dummy
        'instance_method'
      end
      
      def self.class_method_dummy
        'class_method'
      end
      include Pebbles::SuddenlyDeath
    end

    @subject = Dummy.new
  end

  context "included some class" do
    it "should hook raising error on included module's methods execution" do
      proc { 1000.times { @subject.instance_method_dummy } }.
        should raise_error
    end
  end
end

