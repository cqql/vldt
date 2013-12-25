describe Vldt::LengthGreaterThan do
  let(:v) { Vldt::LengthGreaterThan.new(2) }

  it "should fail if the array is of less than the required length" do
    expect(v.validate([true, nil])).to eq({ [] => [[:length_greater_than, { value: 2 }]] })
  end

  it "should succeed if the array is of greater than the required length" do
    expect(v.validate([0, 3, 4])).to eq nil
  end
end
