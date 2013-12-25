describe Vldt::GreaterThanOrEqualTo do
  let(:validation) { Vldt::GreaterThanOrEqualTo.new(5) }

  it "should fail if the number is less than the given one" do
    expect(validation.validate(-1)).to eq({ [] => [[:greater_than_or_equal_to, { value: 5 }]] })
  end

  it "should succeed if the number is greater than the given one" do
    expect(validation.validate(11)).to eq nil
  end
end
