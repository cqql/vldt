describe Vldt::Date do
  describe "#date" do
    let(:v) { Vldt::Date.date }

    it "should fail if the object cannot be parsed as a Date" do
      expect(v.call("not_a_date")).to eq({ [] => [[:date, {}]] })
    end

    it "should succeed if the object can be parsed as a Date" do
      expect(v.call("20140120")).to eq nil
    end
  end

  describe "#iso8601_date" do
    let(:v) { Vldt::Date.iso8601_date }

    it "should fail if the object is not an iso8601 date" do
      expect(v.call("2013-1w-10")).to eq({ [] => [[:iso8601_date, {}]]})
    end

    it "should succeed if the object is an iso8601 date" do
      expect(v.call("2014-01-19")).to eq nil
    end
  end
end
