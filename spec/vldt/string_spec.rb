describe Vldt::String do
  describe "#string" do
    let(:v) { Vldt::String.string }

    it "should fail if the object is no string" do
      expect(v.validate([1, nil])).to eq({ [] => [[:string, {}]] })
    end

    it "should succeed if the object is a string" do
      expect(v.validate("hi")).to eq nil
    end
  end
end
