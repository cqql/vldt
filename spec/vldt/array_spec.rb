describe Vldt::Array do
  describe "#array" do
    let(:v) { Vldt::Array.array }

    it "should fail if the object is not an array" do
      expect(v.validate("hi")).to eq({ [] => [[:array, {}]] })
    end

    it "should succeed if the object is an array" do
      expect(v.validate([1, :t])).to eq nil
    end
  end
end
