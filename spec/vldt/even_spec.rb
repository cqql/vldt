describe Vldt::Even do
  let(:v) { Vldt::Even.new }

  it "should fail if the number is not even" do
    expect(v.validate(-3)).to eq({ [] => [[:even, {}]] })
  end

  it "should succeed if the number is even" do
    expect(v.validate(4)).to eq nil
  end
end
