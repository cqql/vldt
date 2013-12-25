describe Vldt::LengthBetween do
  let(:v) { Vldt::LengthBetween.new(2, 5) }

  it "should fail if the length is greater than the maximum" do
    expect(v.validate((1..10).to_a)).to eq({ [] => [[:length_between, { min: 2, max: 5 }]] })
  end

  it "should fail if the length is less than the minimum" do
    expect(v.validate([1])).to eq({ [] => [[:length_between, { min: 2, max: 5 }]] })
  end

  it "should succeed if the length is in the required range" do
    expect(v.validate([true, false, nil])).to eq nil
  end
end
