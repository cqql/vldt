describe Vldt::NoneOf do
  let(:validator) { Vldt::NoneOf.new("a", "c", "z") }

  it "should succeed if object is not listed" do
    expect(validator.validate("b")).to eq nil
  end

  it "should fail if object is listed" do
    expect(validator.validate("a")).to eq({ [] => [[:none_of, { values: ["a", "c", "z"] }]] })
  end
end
