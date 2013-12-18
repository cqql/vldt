describe Vldt::Validate do
  let(:validation) { Vldt::Validate.new(:key, Vldt::Equal.new(5)) }

  it "should fail if the attribute does not exist" do
    expect(validation.validate({ other: 5 })).to eq({ [:key] => [[:present, {}]] })
  end

  it "should fail if the attribute is not valid" do
    expect(validation.validate({ key: 3 })).to eq({ [:key] => [[:equals, { value: 5 }]] })
  end

  it "should succeed if the attribute is valid" do
    expect(validation.validate({ key: 5 })).to eq nil
  end
end
