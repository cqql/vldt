describe Vldt::Match do
  let(:validator) { Vldt::Match.new(/qq/) }

  it "should succeed if the object matches" do
    expect(validator.validate("cqql")).to eq nil
  end

  it "should fail if the object does not match" do
    expect(validator.validate("cool")).to eq({ [] => [[:match, { pattern: /qq/ }]] })
  end
end
