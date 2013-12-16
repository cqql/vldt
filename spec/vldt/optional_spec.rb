describe Vldt::Optional do
  let(:validation) { Vldt::Optional.new(Vldt::Equal.new(10)) }

  it "should succeed if the object is nil" do
    expect(validation.validate(nil)).to eq nil
  end

  it "should succeed if the validation succeeds" do
    expect(validation.validate(10)).to eq nil
  end

  it "should fail if object is not nil and the validation fails" do
    expect(validation.validate(5)).to eq({ [] => [[:equals, { value: 10 }]] })
  end
end
