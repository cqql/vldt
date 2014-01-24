describe Vldt::Number do
  describe "#greater_than" do
    let(:v) { Vldt::Number.greater_than(13) }

    it "should fail if object is not greater than the minimum" do
      expect(v.call(5)).to eq({ [] => [{ type: :greater_than, params: { min: 13 } }]})
    end

    it "should succeed if object is greater than the minimum" do
      expect(v.call(20)).to eq nil
    end
  end

  describe "#greater_than_or_equal_to" do
    let(:v) { Vldt::Number.greater_than_or_equal_to(5) }

    it "should fail if the number is less than the minimum" do
      expect(v.call(-1)).to eq({ [] => [{ type: :greater_than_or_equal_to, params: { min: 5 } }] })
    end

    it "should succeed if the number is greater than the minimum" do
      expect(v.call(11)).to eq nil
    end
  end

  describe "#less_than" do
    let(:v) { Vldt::Number.less_than(6) }

    it "should fail if the number is not less than the maximum" do
      expect(v.call(10)).to eq({ [] => [{ type: :less_than, params: { max: 6 } }] })
    end

    it "should succeed if the number is less than the maximum" do
      expect(v.call(4)).to eq nil
    end
  end

  describe "#less_than_or_equal_to" do
    let(:v) { Vldt::Number.less_than_or_equal_to(5) }

    it "should fail if the number is greater than the maximum" do
      expect(v.call(5.1)).to eq({ [] => [{ type: :less_than_or_equal_to, params: { max: 5 } }] })
    end

    it "should succeed if the number is less than the maximum" do
      expect(v.call(4.9)).to eq nil
    end
  end

  describe "#between" do
    let(:v) { Vldt::Number.between(-2, 5) }

    it "should fail if the number is out of range" do
      expect(v.call(-6)).to eq({ [] => [{ type: :between, params: { min: -2, max: 5 } }] })
    end

    it "should succeed if the number is in range" do
      expect(v.call(3)).to eq nil
    end
  end

  describe "#integer" do
    let(:v) { Vldt::Number.integer }

    it "should fail if the number is not integral" do
      expect(v.call(1.1)).to eq({ [] => [{ type: :integer, params: {} }] })
    end

    it "should succeed if the number is integral" do
      expect(v.call(4)).to eq nil
    end
  end

  describe "#odd" do
    let(:v) { Vldt::Number.odd }

    it "should fail if the number is not odd" do
      expect(v.call(6)).to eq({ [] => [{ type: :odd, params: {} }] })
    end

    it "should succeed if the number is odd" do
      expect(v.call(5)).to eq nil
    end
  end

  describe "#even" do
    let(:v) { Vldt::Number.even }

    it "should fail if the number is not even" do
      expect(v.call(-3)).to eq({ [] => [{ type: :even, params: {} }] })
    end

    it "should succeed if the number is even" do
      expect(v.call(4)).to eq nil
    end
  end

  describe "#number" do
    let(:v) { Vldt::Number.number }

    it "should fail if the object is not numeric" do
      expect(v.call([])).to eq({ [] => [{ type: :number, params: {} }] })
    end

    it "should succeed if the object is numeric" do
      expect(v.call(5.3)).to eq nil
    end
  end

  describe "#positive" do
    let(:v) { Vldt::Number.positive }

    it "should fail if the number is negative" do
      expect(v.call(-2.2)).to eq({ [] => [{ type: :positive, params: {} }] })
    end

    it "should fail if the number is zero" do
      expect(v.call(0)).to eq({ [] => [{ type: :positive, params: {} }] })
    end

    it "should succeed if the number is positive" do
      expect(v.call(2)).to eq nil
    end
  end

  describe "#not_positive" do
    let(:v) { Vldt::Number.not_positive }

    it "should fail if the number is positive" do
      expect(v.call(2.2)).to eq({ [] => [{ type: :not_positive, params: {} }] })
    end

    it "should succeed if the number is zero" do
      expect(v.call(0)).to eq nil
    end

    it "should succeed if the number is negative" do
      expect(v.call(-2)).to eq nil
    end
  end

  describe "#negative" do
    let(:v) { Vldt::Number.negative }

    it "should fail if the number is positive" do
      expect(v.call(2.2)).to eq({ [] => [{ type: :negative, params: {} }] })
    end

    it "should fail if the number is zero" do
      expect(v.call(0)).to eq({ [] => [{ type: :negative, params: {} }] })
    end

    it "should succeed if the number is negative" do
      expect(v.call(-2)).to eq nil
    end
  end

  describe "#not_negative" do
    let(:v) { Vldt::Number.not_negative }

    it "should fail if the number is negative" do
      expect(v.call(-2.2)).to eq({ [] => [{ type: :not_negative, params: {} }] })
    end

    it "should succeed if the number is zero" do
      expect(v.call(0)).to eq nil
    end

    it "should succeed if the number is positive" do
      expect(v.call(2)).to eq nil
    end
  end
end
