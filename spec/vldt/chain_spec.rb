describe Vldt::Chain do
  let(:validator) { Vldt::Chain.new(Vldt::Present.new, Vldt::Match.new(/ab/)) }

  context "if the object is invalid" do
    it "should fail with the first error" do
      expect(validator.validate(nil)).to eq({ [] => [[:present, {}]] })
    end

    it "should fail with the second error" do
      expect(validator.validate("cqql")).to eq({ [] => [[:match, { pattern: /ab/ }]] })
    end
  end

  it "should succeed if all validates succeed" do
    expect(validator.validate("abc")).to eq nil
  end
end
