describe Vldt::Optional do
  let(:validator) { Vldt::Optional.new(Vldt::Equal.new(10)) }

  it "should succeed if the object is nil" do
    expect(validator.validate(nil)).to eq nil
  end

  it "should succeed if the validator succeeds" do
    expect(validator.validate(10)).to eq nil
  end

  it "should fail if object is not nil and the validator fails" do
    expect(validator.validate(5)).to eq({ [] => [[:equals, { value: 10 }]] })
  end
end
