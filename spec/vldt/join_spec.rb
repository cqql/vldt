describe Vldt::Join do
  let(:validation) { Vldt::Join.new(Vldt::Present.new, Vldt::String.match(/ab/)) }

  context "if one of the joined validations fails" do
    it "should report the errors of all failed validations" do
      expect(validation.validate(nil)).to eq({ [] => [[:present, {}], [:match, { pattern: /ab/ }]] })
    end

    it "should report only errors of failed validations" do
      expect(validation.validate("cqql")).to eq({ [] => [[:match, { pattern: /ab/ }]] })
    end
  end

  it "should succeed if all joined validations succeed" do
    expect(validation.validate("abc")).to eq nil
  end
end
