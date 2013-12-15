describe Vldt::Nil do
  let(:validator) { Vldt::Nil.new }

  it "should succeed if the object is nil" do
    expect(validator.validate(nil)).to eq nil
  end

  it "should fail if the object is not nil" do
    expect(validator.validate(true)).to eq({ [] => [[:nil, {}]] })
  end
end
