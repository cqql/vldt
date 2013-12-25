describe Vldt::String do
  let(:v) { Vldt::String.new }

  it "should fail if the object is no string" do
    expect(v.validate([1, nil])).to eq({ [] => [[:string, {}]] })
  end

  it "should succeed if the object is a string" do
    expect(v.validate("hi")).to eq nil
  end
end
