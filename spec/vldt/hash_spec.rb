describe Vldt::Hash do
  describe "#is_hash" do
    let(:v) { Vldt::Hash.is_hash }

    it "should fail if the object is not a hash" do
      expect(v.call(2)).to eq({ [] => [{ type: :hash, params: {} }] })
    end

    it "should succeed if the object is a hash" do
      expect(v.call({ hash: :yo })).to eq nil
    end
  end
end
