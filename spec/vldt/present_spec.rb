describe Vldt::Present do
  let(:validator) { Vldt::Present.new }

  it "should succeed if object is not nil" do
    expect(validator.validate(1)).to eq nil
  end

  it "should fail if the object is nil" do
    expect(validator.validate(nil)).to eq({ [] => [[:present, {}]] })
  end
end
