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
end
