describe Vldt::WholeNumber do
  let(:v) { Vldt::WholeNumber.new }

  it "should fail if the number is not whole" do
    expect(v.validate(1.1)).to eq({ [] => [[:whole_number, {}]] })
  end

  it "should succeed if the number is whole" do
    expect(v.validate(4)).to eq nil
  end
end
