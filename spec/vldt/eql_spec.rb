describe Vldt::Eql do
  let(:validation) { Vldt::Eql.new(1.0) }

  it "should succeed if the object eqls the value" do
    expect(validation.validate(1.0)).to eq nil
  end

  it "should fail if the object does not eql the value" do
    expect(validation.validate(1)).to eq({ [] => [[:eqls, { value: 1.0 }]] })
  end
end
