describe Vldt::String do
  describe "#string" do
    let(:v) { Vldt::String.string }

    it "should fail if the object is no string" do
      expect(v.call([1, nil])).to eq({ [] => [{ type: :string, params: {} }] })
    end

    it "should succeed if the object is a string" do
      expect(v.call("hi")).to eq nil
    end
  end

  describe "#match" do
    let(:v) { Vldt::String.match(/qq/) }

    it "should succeed if the object matches" do
      expect(v.call("cqql")).to eq nil
    end

    it "should fail if the object does not match" do
      expect(v.call("cool")).to eq({ [] => [{ type: :match, params: { pattern: /qq/ } }] })
    end
  end

  describe "#length" do
    let(:v) { Vldt::String.length(2) }

    it "should fail if the string is not of the required length" do
      expect(v.call([])).to eq({ [] => [{ type: :length, params: { value: 2 } }]})
    end

    it "should succeed if the string is of the required length" do
      expect(v.call([1, 5])).to eq nil
    end
  end

  describe "#length_between" do
    let(:v) { Vldt::String.length_between(2, 5) }

    it "should fail if the length is greater than the maximum" do
      expect(v.call((1..10).to_a)).to eq({ [] => [{ type: :length_between, params: { min: 2, max: 5 } }] })
    end

    it "should fail if the length is less than the minimum" do
      expect(v.call([1])).to eq({ [] => [{ type: :length_between, params: { min: 2, max: 5 } }] })
    end

    it "should succeed if the length is in the required range" do
      expect(v.call("abc")).to eq nil
    end
  end

  describe "#length_greater_than" do
    let(:v) { Vldt::String.length_greater_than(2) }

    it "should fail if the string is of less than the required length" do
      expect(v.call("hi")).to eq({ [] => [{ type: :length_greater_than, params: { min: 2 } }] })
    end

    it "should succeed if the string is of greater than the required length" do
      expect(v.call([0, 3, 4])).to eq nil
    end
  end

  describe "#length_less_than" do
    let(:v) { Vldt::String.length_less_than(2) }

    it "should fail if the object is of greater than the required length" do
      expect(v.call([true, false])).to eq({ [] => [{ type: :length_less_than, params: { max: 2 } }] })
    end

    it "should succeed if the object is of less than the required length" do
      expect(v.call("x")).to eq nil
    end
  end
end
