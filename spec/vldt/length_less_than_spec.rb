describe Vldt::LengthLessThan do
  let(:v) { Vldt::LengthLessThan.new(2) }

  it "should fail if the array is of greater than the required length" do
    expect(v.validate([true, false])).to eq({ [] => [[:length_less_than, { value: 2 }]] })
  end

  it "should succeed if the array is of less than the required length" do
    expect(v.validate([0])).to eq nil
  end
end
