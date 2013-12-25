describe Vldt::Positive do
  let(:v) { Vldt::Positive.new }

  it "should fail if the number is negative" do
    expect(v.validate(-2.2)).to eq({ [] => [[:positive, {}]] })
  end

  it "should fail if the number is zero" do
    expect(v.validate(0)).to eq({ [] => [[:positive, {}]] })
  end

  it "should succeed if the number is positive" do
    expect(v.validate(2)).to eq nil
  end
end
