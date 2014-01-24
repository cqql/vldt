describe Vldt::Chain do
  let(:v) { Vldt::Chain.new(Vldt::Common.present, Vldt::String.match(/ab/)) }

  context "if the object is invalid" do
    it "should fail with the first error" do
      expect(v.call(nil)).to eq({ [] => [{ type: :present, params: {} }] })
    end

    it "should fail with the second error" do
      expect(v.call("cqql")).to eq({ [] => [{ type: :match, params: { pattern: /ab/ } }] })
    end
  end

  it "should succeed if all validates succeed" do
    expect(v.call("abc")).to eq nil
  end
end
