describe Vldt::GreaterThan do
  let(:validator) { Vldt::GreaterThan.new(13) }

  it "should fail if object is not greater than the minimum" do
    expect(validator.validate(5)).to eq({ [] => [[:greater_than, { min: 13 }]]})
  end

  it "should succeed if object is greater than the minimum" do
    expect(validator.validate(20)).to eq nil
  end
end
