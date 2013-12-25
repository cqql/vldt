describe Vldt::Each do
  let(:validation) { Vldt::Each.new(Vldt::GreaterThan.new(3)) }

  it "should fail if the object is not enumerable" do
    expect(validation.validate(5)).to eq({ [] => [[:array, {}]]})
  end

  it "should fail if at least one object is invalid" do
    expect(validation.validate([0, 10, 4, 2])).to eq({
      [0] => [[:greater_than, { min: 3 }]],
      [3] => [[:greater_than, { min: 3 }]]
    })
  end

  it "should succeed if all objects are valid" do
    expect(validation.validate([6, 5, 8])).to eq nil
  end
end
