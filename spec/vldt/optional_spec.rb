describe Vldt::Optional do
  let(:v) { Vldt::Optional.new(Vldt::Common.equal(10)) }

  it "should succeed if the object is nil" do
    expect(v.validate(nil)).to eq nil
  end

  it "should succeed if the v succeeds" do
    expect(v.validate(10)).to eq nil
  end

  it "should fail if object is not nil and the v fails" do
    expect(v.validate(5)).to eq({ [] => [[:equals, { value: 10 }]] })
  end
end
