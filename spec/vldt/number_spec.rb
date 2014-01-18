describe Vldt::Number do
  let(:validation) { Vldt::Number.number }

  it "should fail if the object is not numeric" do
    expect(validation.validate([])).to eq({ [] => [[:number, {}]] })
  end

  it "should succeed if the object is numeric" do
    expect(validation.validate(5.3)).to eq nil
  end
end
