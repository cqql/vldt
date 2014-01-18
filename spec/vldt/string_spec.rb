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

  describe "#match" do
    let(:v) { Vldt::String.match(/qq/) }

    it "should succeed if the object matches" do
      expect(v.validate("cqql")).to eq nil
    end

    it "should fail if the object does not match" do
      expect(v.validate("cool")).to eq({ [] => [[:match, { pattern: /qq/ }]] })
    end
  end
end
