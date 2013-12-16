describe Vldt::NoneOf do
  let(:validation) { Vldt::NoneOf.new("a", "c", "z") }

  it "should succeed if object is not listed" do
    expect(validation.validate("b")).to eq nil
  end

  it "should fail if object is listed" do
    expect(validation.validate("a")).to eq({ [] => [[:none_of, { values: ["a", "c", "z"] }]] })
  end
end
