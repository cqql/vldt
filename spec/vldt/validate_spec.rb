describe Vldt::Validate do
  let(:v) { Vldt::Validate.new(:key, Vldt::Common.equals(5)) }

  it "should fail if the attribute does not exist" do
    expect(v.call({ other: 5 })).to eq({ [:key] => [[:present, {}]] })
  end

  it "should fail if the attribute is not valid" do
    expect(v.call({ key: 3 })).to eq({ [:key] => [[:equals, { value: 5 }]] })
  end

  it "should succeed if the attribute is valid" do
    expect(v.call({ key: 5 })).to eq nil
  end
end
