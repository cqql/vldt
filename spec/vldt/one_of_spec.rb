describe Vldt::OneOf do
  let(:validator) { Vldt::OneOf.new(1, 3, 7) }

  it "should succeed if object is listed" do
    expect(validator.validate(7)).to eq nil
  end

  it "should fail if object is not listed" do
    expect(validator.validate(8)).to eq({ [] => [[:one_of, { values: [1, 3, 7] }]] })
  end
end
