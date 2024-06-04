require 'units_converter'

RSpec.describe UnitsConverter do
  describe '.convert_length' do
    it 'converts meters to feet' do
      expect(UnitsConverter.convert_length(10, 'm', 'ft')).to be_within(0.01).of(32.81)
    end

    it 'converts inches to centimeters' do
      expect(UnitsConverter.convert_length(10, 'in', 'cm')).to be_within(0.01).of(25.40)
    end

    it 'raises an error for invalid from_unit' do
      expect { UnitsConverter.convert_length(10, 'invalid', 'm') }.to raise_error(ArgumentError)
    end

    it 'raises an error for invalid to_unit' do
      expect { UnitsConverter.convert_length(10, 'm', 'invalid') }.to raise_error(ArgumentError)
    end
  end

  describe '.convert_weight' do
    it 'converts kilograms to pounds' do
      expect(UnitsConverter.convert_weight(10, 'kg', 'lb')).to be_within(0.01).of(22.05)
    end

    it 'converts ounces to grams' do
      expect(UnitsConverter.convert_weight(10, 'oz', 'g')).to be_within(0.01).of(283.50)
    end

    it 'raises an error for invalid from_unit' do
      expect { UnitsConverter.convert_weight(10, 'invalid', 'kg') }.to raise_error(ArgumentError)
    end

    it 'raises an error for invalid to_unit' do
      expect { UnitsConverter.convert_weight(10, 'kg', 'invalid') }.to raise_error(ArgumentError)
    end
  end

  describe '.convert_temperature' do
    it 'converts Celsius to Fahrenheit' do
      expect(UnitsConverter.convert_temperature(0, 'C', 'F')).to be_within(0.01).of(32.00)
    end

    it 'converts Fahrenheit to Celsius' do
      expect(UnitsConverter.convert_temperature(32, 'F', 'C')).to be_within(0.01).of(0.00)
    end

    it 'converts Celsius to Kelvin' do
      expect(UnitsConverter.convert_temperature(0, 'C', 'K')).to be_within(0.01).of(273.15)
    end

    it 'raises an error for invalid from_unit' do
      expect { UnitsConverter.convert_temperature(0, 'invalid', 'C') }.to raise_error(ArgumentError)
    end

    it 'raises an error for invalid to_unit' do
      expect { UnitsConverter.convert_temperature(0, 'C', 'invalid') }.to raise_error(ArgumentError)
    end
  end
end