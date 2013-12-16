describe Vldt::Join do
  let(:validator) { Vldt::Join.new(Vldt::Present.new, Vldt::Match.new(/ab/)) }

  context "if one of the joined validations fails" do
    it "should report the errors of all failed validations" do
      expect(validator.validate(nil)).to eq({ [] => [[:present, {}], [:match, { pattern: /ab/ }]] })
    end

    it "should report only errors of failed validations" do
      expect(validator.validate("cqql")).to eq({ [] => [[:match, { pattern: /ab/ }]] })
    end
  end

  it "should succeed if all joined validations succeed" do
    expect(validator.validate("abc")).to eq nil
  end
end
