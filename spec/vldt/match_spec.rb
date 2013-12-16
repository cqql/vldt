describe Vldt::Match do
  let(:validation) { Vldt::Match.new(/qq/) }

  it "should succeed if the object matches" do
    expect(validation.validate("cqql")).to eq nil
  end

  it "should fail if the object does not match" do
    expect(validation.validate("cool")).to eq({ [] => [[:match, { pattern: /qq/ }]] })
  end
end
