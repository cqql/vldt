describe Vldt::Identical do
  let(:value) { "a" }
  let(:validation) { Vldt::Identical.new(value) }

  it "should succeed if object and value are idential" do
    expect(validation.validate(value)).to eq nil
  end

  it "should fail if object and value are not identical" do
    expect(validation.validate(String.new(value))).to eq({ [] => [[:identical, { value: value }]] })
  end
end
