describe Vldt::LessThan do
  let(:validation) { Vldt::LessThan.new(6) }

  it "should fail if the number is not less than the given one" do
    expect(validation.validate(10)).to eq({ [] => [[:less_than, { value: 6 }]] })
  end

  it "should succeed if the number is less than the given one" do
    expect(validation.validate(4)).to eq nil
  end
end
