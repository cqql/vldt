describe Vldt::Between do
  let(:v) { Vldt::Between.new(-2, 5) }

  it "should fail if the number is out of range" do
    expect(v.validate(-6)).to eq({ [] => [[:between, { min: -2, max: 5 }]] })
  end

  it "should succeed if the number is in range" do
    expect(v.validate(3)).to eq nil
  end
end
