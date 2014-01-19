describe Vldt::With do
  let(:v) { Vldt::With.new(-> s { s.chars }, Vldt::Array.length(4)) }

  it "should map the lambda over the value before applying the validation" do
    expect(v.call("test")).to eq nil
  end

  it "should propagate a fail" do
    expect(v.call("hi")).to eq({ [] => [[:array_length, { value: 4 }]]})
  end

  it "should not catch errors" do
    expect { v.call(1) }.to raise_error
  end
end
