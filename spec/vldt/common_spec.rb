describe Vldt::Common do
  describe "#absent" do
    let(:v) { Vldt::Common.absent }

    it "should succeed if the object is nil" do
      expect(v.call(nil)).to eq nil
    end

    it "should fail if the object is not nil" do
      expect(v.call(true)).to eq({ [] => [{ type: :absent, params: {} }] })
    end
  end

  describe "#present" do
    let(:v) { Vldt::Common.present }

    it "should succeed if object is not nil" do
      expect(v.call(1)).to eq nil
    end

    it "should fail if the object is nil" do
      expect(v.call(nil)).to eq({ [] => [{ type: :present, params: {} }] })
    end
  end

  describe "#equal" do
    let(:v) { Vldt::Common.equals(10) }

    it "should succeed if the object equals the configured value" do
      expect(v.call(10)).to eq nil
    end

    it "should fail if the object is not equal" do
      expect(v.call(11)).to eq({ [] => [{ type: :equals, params: { value: 10 } }] })
    end
  end

  describe "#eql" do
    let(:v) { Vldt::Common.eqls(1.0) }

    it "should succeed if the object eqls the value" do
      expect(v.call(1.0)).to eq nil
    end

    it "should fail if the object does not eql the value" do
      expect(v.call(1)).to eq({ [] => [{ type: :eqls, params: { value: 1.0 } }] })
    end
  end

  describe "#identical" do
    let(:value) { "a" }
    let(:v) { Vldt::Common.identical(value) }

    it "should succeed if object and value are idential" do
      expect(v.call(value)).to eq nil
    end

    it "should fail if object and value are not identical" do
      expect(v.call(String.new(value))).to eq({ [] => [{ type: :identical, params: { value: value } }] })
    end
  end

  describe "#is_a" do
    let(:v) { Vldt::Common.is_a(String) }

    it "should succeed if object is of the given class" do
      expect(v.call("string")).to eq nil
    end

    it "should fail if object is not of the given class" do
      expect(v.call(1)).to eq({ [] => [{ type: :is_a, params: { class: String } }] })
    end
  end

  describe "#one_of" do
    let(:v) { Vldt::Common.one_of(1, 3, 7) }

    it "should succeed if object is listed" do
      expect(v.call(7)).to eq nil
    end

    it "should fail if object is not listed" do
      expect(v.call(8)).to eq({ [] => [{ type: :one_of, params: { values: [1, 3, 7] } }] })
    end
  end

  describe "#none_of" do
    let(:v) { Vldt::Common.none_of("a", "c", "z") }

    it "should succeed if object is not listed" do
      expect(v.call("b")).to eq nil
    end

    it "should fail if object is listed" do
      expect(v.call("a")).to eq({ [] => [{ type: :none_of, params: { values: ["a", "c", "z"] } }] })
    end
  end
end
