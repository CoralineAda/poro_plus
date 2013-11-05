require 'spec_helper'

describe PoroPlus do

  class Thing
    include PoroPlus
    attr_accessor :foo
    attr_accessor :bar
  end

  describe '#sanitized_key' do
    it 'converts a @foo-style instance variable to a symbol' do
      thing = Thing.new
      thing.send(:sanitized_key, "@foo_bar").should == :foo_bar
    end
  end

  describe '#to_hash' do

    it 'serializes its instance variables' do
      thing = Thing.new(foo: 1, bar: 2)
      thing.to_hash[:foo].should == 1
      thing.to_hash[:bar].should == 2
    end

    it 'nil-values are not skipped normally' do 
      thing = Thing.new(foo: 1, bar: nil)
      thing.to_hash[:foo].should == 1
      thing.to_hash[:bar].should be_nil
    end

    it 'skips nil-value instance variables if so configured with skip_nils flag' do
      thing = Thing.new(foo: 1, bar: nil)
      thing.to_hash(:skip_nils => true).keys.include?(:bar).should be_false
    end

  end
 
  describe '#to_json' do
    it "converts its instance variables to json string" do
      thing = Thing.new(foo: 1, bar: 2)
      thing.to_json.should == "{\"foo\":1,\"bar\":2}"
    end

    it "converts nils to null" do
      thing = Thing.new(foo: 1, bar: nil)
      thing.to_json.should == "{\"foo\":1,\"bar\":null}"
    end

    it 'skips nil-value instance variables if so configured with skip_nils flag' do
      thing = Thing.new(foo: 1, bar: nil)
      thing.to_json(:skip_nils => true).should == "{\"foo\":1}"
    end

  end

end

