describe Vldt::DSL do
  v = Class.new do
    extend Vldt::DSL

    def self.user
      join(
        validate(:name, join(
          string,
          length_greater_than(6))),
        validate(:email, string),
        validate(:age, join(whole_number, positive)))
    end
  end

  it "should validate a user" do
    expect(v.user.validate({ name: "cqql#", email: "1@3", age: -3.3 })).to eq({
      [:name] => [[:length, { value: 6 }]],
      [:age] => [[:whole_number, {}], [:positive, {}]]
    })
  end

  it "should "
end
