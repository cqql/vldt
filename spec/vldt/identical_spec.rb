describe Vldt::Identical do
  let(:value) { "a" }
  let(:validator) { Vldt::Identical.new(value) }

  it "should succeed if object and value are idential" do
    expect(validator.validate(value)).to eq nil
  end

  it "should fail if object and value are not identical" do
    expect(validator.validate(String.new(value))).to eq({ [] => [[:identical, { value: value }]] })
  end
end
