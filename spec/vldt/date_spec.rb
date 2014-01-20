describe Vldt::Date do
  describe "#date" do
    let(:v) { Vldt::Date.date }

    it "should fail if the object cannot be parsed as a Date" do
      expect(v.call("not_a_date")).to eq({ [] => [[:date, {}]] })
    end

    it "should succeed if the object can be parsed as a Date" do
      expect(v.call("20140120")).to eq nil
    end

    it "should succeed if the object is a date" do
      expect(v.call(Date.today)).to eq nil
    end
  end

  describe "#date_after" do
    let(:v) { Vldt::Date.date_after(Date.new(2014, 1, 2)) }

    it "should fail if the date is before the given one" do
      expect(v.call(Date.new(2013, 12, 12))).to eq ({ [] => [[:date_after, date: Date.new(2014, 1, 2)]] })
    end

    it "should succeed if the date is after the given one" do
      expect(v.call(Date.new(2014, 5, 6))).to eq nil
    end
  end

  describe "#date_before" do
    let(:v) { Vldt::Date.date_before(Date.new(2005, 1, 2)) }

    it "should fail if the date is after the given one" do
      expect(v.call(Date.new(2013, 12, 12))).to eq ({ [] => [[:date_before, date: Date.new(2005, 1, 2)]] })
    end

    it "should succeed if the date is before the given one" do
      expect(v.call(Date.new(2000, 1, 1))).to eq nil
    end
  end

  describe "#date_between" do
    let(:v) { Vldt::Date.date_between(Date.new(2010, 1, 1), Date.new(2012, 6, 6)) }

    it "should fail if the date is before the minimum" do
      expect(v.call(Date.new(2000, 1, 1))).to eq({ [] => [[:date_between, min: Date.new(2010, 1, 1), max: Date.new(2012, 6, 6)]] })
    end

    it "should fail if the date is after the maximum" do
      expect(v.call(Date.new(2015, 1, 1))).to eq({ [] => [[:date_between, min: Date.new(2010, 1, 1), max: Date.new(2012, 6, 6)]] })
    end

    it "should succeed if the date is in the allowed range" do
      expect(v.call(Date.new(2011, 2, 28))).to eq nil
    end
  end

  describe "#with_date" do
    let(:v) { Vldt::Date.with_date(Vldt::Date.date_after(Date.new(2008, 3, 2))) }

    it "should parse the object as a date" do
      expect(v.call("2014-02-01")).to eq nil
    end

    it "should forward errors" do
      expect(v.call("19950101")).to eq({ [] => [[:date_after, date: Date.new(2008, 3, 2)]] })
    end
  end
end
