describe Vldt::Absent do
  let(:validation) { Vldt::Absent.new }

  it "should succeed if the object is nil" do
    expect(validation.validate(nil)).to eq nil
  end

  it "should fail if the object is not nil" do
    expect(validation.validate(true)).to eq({ [] => [[:absent, {}]] })
  end
end
