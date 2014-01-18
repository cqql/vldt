describe Vldt::With do
  let(:v) { Vldt::With.new(-> s { s.chars }, Vldt::Array.array) }

  it "should map the lambda over the value before applying the validation" do
    expect(v.call("test")).to eq nil
  end
end
