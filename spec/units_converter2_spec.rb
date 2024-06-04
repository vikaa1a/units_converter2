require 'units_converter2'

RSpec.describe UnitsConverter do
  describe ".convert_length" do
    it "converts from meters to centimeters" do
      expect(UnitsConverter.convert_length(1, 'm', 'cm')).to eq(100)
    end

    it "converts from inches to feet" do
      expect(UnitsConverter.convert_length(12, 'in', 'ft')).to eq(1)
    end

    it "raises an error for invalid units" do
      expect { UnitsConverter.convert_length(1, 'm', 'invalid') }.to raise_error(ArgumentError)
    end
  end

  describe ".convert_weight" do
    it "converts from grams to kilograms" do
      expect(UnitsConverter.convert_weight(1000, 'g', 'kg')).to eq(1)
    end

    it "converts from ounces to pounds" do
      expect(UnitsConverter.convert_weight(16, 'oz', 'lb')).to eq(1)
    end

    it "raises an error for invalid units" do
      expect { UnitsConverter.convert_weight(1, 'g', 'invalid') }.to raise_error(ArgumentError)
    end
  end

  describe ".convert_temperature" do
    it "converts from Celsius to Fahrenheit" do
      expect(UnitsConverter.convert_temperature(0, 'C', 'F')).to eq(32)
    end

    it "converts from Kelvin to Celsius" do
      expect(UnitsConverter.convert_temperature(273.15, 'K', 'C')).to eq(0)
    end

    it "raises an error for invalid units" do
      expect { UnitsConverter.convert_temperature(1, 'C', 'invalid') }.to raise_error(ArgumentError)
    end
  end
end
