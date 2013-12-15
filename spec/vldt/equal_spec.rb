describe Vldt::Equal do
  let(:validator) { Vldt::Equal.new(10) }

  it "should succeed if the object equals the configured value" do
    expect(validator.validate(10)).to eq nil
  end

  it "should fail if the object is not equal" do
    expect(validator.validate(11)).to eq({ [] => [[:equals, { value: 10 }]] })
  end
end
