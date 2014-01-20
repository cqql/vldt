describe Vldt::JSON do
  describe "#json" do
    let(:v) { Vldt::JSON.json }

    it "should fail if the object is not a valid JSON string" do
      expect(v.call("{ 's': }")).to eq({ [] => [[:json, {}]]})
    end

    it "should succeed if the object is a JSON string" do
      expect(v.call("{ \"woah\": 1 }")).to eq nil
    end
  end

  describe "#with_json" do
    let(:v) { Vldt::JSON.with_json(Vldt::Common.validate("key", Vldt::Common.equal(1))) }

    it "should parse the object as a JSON string" do
      expect(v.call("{ \"key\": 1 }")).to eq nil
    end

    it "should forward errors" do
      expect(v.call("{ \"key\": 3 }")).to eq({ ["key"] => [[:equals, { value: 1 }]] })
    end
  end
end
