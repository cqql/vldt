describe Vldt::GreaterThan do
  let(:validator) { Vldt::GreaterThan.new(13) }

  it "should fail if object is not greater than value" do
    expect(validator.validate(5)).to eq({ [] => [[:greater_than, { value: 13 }]]})
  end

  it "should succeed if object is greater than value" do
    expect(validator.validate(20)).to eq nil
  end
end
