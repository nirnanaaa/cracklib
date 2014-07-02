require 'spec_helper'

describe Cracklib::Check do
  describe "without dictionary" do
    it "should not initialize without arguments" do
      expect{Cracklib::Check.new}.to raise_error
    end
    it "should not initialize with nil argument" do
      expect{Cracklib::Check.new(nil)}.to raise_error ArgumentError
    end
    it "should not initialize with empty arguments" do
      expect{Cracklib::Check.new("")}.to raise_error ArgumentError
    end
    it "fails to validate password if the dictionary was not found" do
      c = Cracklib::Check.new("spec/bla")
      expect{c.valid?("password")}.to raise_error
    end
  end
  describe "with dictionary" do
    let(:crack){Cracklib::Check.new("spec/words")}
    it "fails if the provided string is nil" do
      expect{crack.valid?(nil)}.to raise_error
    end
    it "casts the object name to string if object supplied" do
      expect{crack.valid?(Kernel)}.to raise_error Cracklib::InvalidPasswordError
    end
    it "returns true if a valid password was supplied" do
      expect(crack.valid?("091349091u09gh0w0hrb09w")) == true
    end
    it "fails if the provided string is empty" do
      expect{crack.valid?("")}.to raise_error Cracklib::InvalidPasswordError
    end
    it "failes if the provided string was found in dictionary" do
      expect{crack.valid?("rooten")}.to raise_error Cracklib::InvalidPasswordError
    end
  end
end
