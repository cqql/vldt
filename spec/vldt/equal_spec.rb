describe Vldt::Equal do
  let(:validation) { Vldt::Equal.new(10) }

  it "should succeed if the object equals the configured value" do
    expect(validation.validate(10)).to eq nil
  end

  it "should fail if the object is not equal" do
    expect(validation.validate(11)).to eq({ [] => [[:equals, { value: 10 }]] })
  end
end
