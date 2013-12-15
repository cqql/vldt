describe Vldt::IsA do
  let(:validator) { Vldt::IsA.new(String) }

  it "should succeed if object is of the given class" do
    expect(validator.validate("string")).to eq nil
  end

  it "should fail if object is not of the given class" do
    expect(validator.validate(1)).to eq({ [] => [[:is_a, { class: String }]] })
  end
end
