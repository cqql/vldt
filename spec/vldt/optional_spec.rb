describe Vldt::Optional do
  let(:v) { Vldt::Optional.new(Vldt::Common.equals(10)) }

  it "should succeed if the object is nil" do
    expect(v.call(nil)).to eq nil
  end

  it "should succeed if the v succeeds" do
    expect(v.call(10)).to eq nil
  end

  it "should fail if object is not nil and the v fails" do
    expect(v.call(5)).to eq({ [] => [[:equals, { value: 10 }]] })
  end
end
