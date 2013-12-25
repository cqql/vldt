describe Vldt::LengthLessThan do
  let(:v) { Vldt::LengthLessThan.new(2) }

  it "should fail if the object is of greater than the required length" do
    expect(v.validate([true, false])).to eq({ [] => [[:length_less_than, { max: 2 }]] })
  end

  it "should succeed if the object is of less than the required length" do
    expect(v.validate("x")).to eq nil
  end
end
