describe Vldt::Odd do
  let(:validation) { Vldt::Odd.new }

  it "should fail if the number is not odd" do
    expect(validation.validate(6)).to eq({ [] => [[:odd, {}]] })
  end

  it "should succeed if the number is odd" do
    expect(validation.validate(5)).to eq nil
  end
end
