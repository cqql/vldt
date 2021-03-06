describe Vldt::Validate do
  let(:v) { Vldt::Validate.new(:key, Vldt::Common.equals(5)) }

  it "should fail if the attribute does not exist" do
    expect(v.call({ other: 5 })).to eq({ [:key] => [{ type: :present, params: {} }] })
  end

  it "should fail if the attribute is not valid" do
    expect(v.call({ key: 3 })).to eq({ [:key] => [{ type: :equals, params: { value: 5 } }] })
  end

  it "should fail if the object is not a hash" do
    expect(v.call("Not a hash")).to eq({ [] => [{ type: :hash, params: {} }] })
  end

  it "should succeed if the attribute is valid" do
    expect(v.call({ key: 5 })).to eq nil
  end
end
