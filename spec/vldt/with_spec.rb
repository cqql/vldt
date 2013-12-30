describe Vldt::With do
  let(:v) { Vldt::With.new(-> s { s.chars }, Vldt::Array.new) }

  it "should map the lambda over the value before applying the validation" do
    expect(v.validate("test")).to eq nil
  end
end
