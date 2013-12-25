describe Vldt::LessThanOrEqualTo do
  let(:validation) { Vldt::LessThanOrEqualTo.new(5) }

  it "should fail if the number is greater than the given one" do
    expect(validation.validate(5.1)).to eq({ [] => [[:less_than_or_equal_to, { value: 5 }]] })
  end

  it "should succeed if the number is less than the given one" do
    expect(validation.validate(4.9)).to eq nil
  end
end
