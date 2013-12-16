describe Vldt::Present do
  let(:validation) { Vldt::Present.new }

  it "should succeed if object is not nil" do
    expect(validation.validate(1)).to eq nil
  end

  it "should fail if the object is nil" do
    expect(validation.validate(nil)).to eq({ [] => [[:present, {}]] })
  end
end
