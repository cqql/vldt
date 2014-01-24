describe Vldt::Each do
  let(:v) { Vldt::Each.new(Vldt::Number.greater_than(3)) }

  it "should fail if the object is not enumerable" do
    expect(v.call(5)).to eq({ [] => [{ type: :array, params: {} }] })
  end

  it "should fail if at least one object is invalid" do
    expect(v.call([0, 10, 4, 2])).to eq({
      [0] => [{ type: :greater_than, params: { min: 3 } }],
      [3] => [{ type: :greater_than, params: { min: 3 } }]
    })
  end

  it "should succeed if all objects are valid" do
    expect(v.call([6, 5, 8])).to eq nil
  end
end
