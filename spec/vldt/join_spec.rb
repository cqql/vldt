describe Vldt::Join do
  let(:v) { Vldt::Join.new(Vldt::Common.present, Vldt::String.match(/ab/)) }

  context "if one of the joined validations fails" do
    it "should report the errors of all failed validations" do
      expect(v.call(nil)).to eq({ [] => [[:present, {}], [:match, { pattern: /ab/ }]] })
    end

    it "should report only errors of failed validations" do
      expect(v.call("cqql")).to eq({ [] => [[:match, { pattern: /ab/ }]] })
    end
  end

  it "should succeed if all joined validations succeed" do
    expect(v.call("abc")).to eq nil
  end
end
