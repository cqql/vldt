describe Vldt::NotNegative do
  let(:v) { Vldt::NotNegative.new }

  it "should fail if the number is negative" do
    expect(v.validate(-2.2)).to eq({ [] => [[:not_negative, {}]] })
  end

  it "should succeed if the number is zero" do
    expect(v.validate(0)).to eq nil
  end

  it "should succeed if the number is positive" do
    expect(v.validate(2)).to eq nil
  end
end
