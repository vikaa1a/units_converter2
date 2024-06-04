# frozen_string_literal: true

require_relative "units_converter/version"

module UnitsConverter
  class Error < StandardError; end
  LENGTH_UNITS = {
    'm' => 1.0,
    'cm' => 0.01,
    'mm' => 0.001,
    'km' => 1000,
    'in' => 0.0254,
    'ft' => 0.3048,
    'yd' => 0.9144,
    'mi' => 1609.344
  }

  WEIGHT_UNITS = {
    'g' => 1.0,
    'kg' => 1000,
    'oz' => 28.3495,
    'lb' => 453.592
  }

  TEMPERATURE_UNITS = {
    'C' => 1.0,
    'F' => (5.0 / 9.0),
    'K' => (5.0 / 9.0)
  }

  def self.convert_length(value, from_unit, to_unit)
    raise ArgumentError, "Invalid from_unit: #{from_unit}" unless LENGTH_UNITS.key?(from_unit)
    raise ArgumentError, "Invalid to_unit: #{to_unit}" unless LENGTH_UNITS.key?(to_unit)

    value * (LENGTH_UNITS[to_unit] / LENGTH_UNITS[from_unit])
  end

  def self.convert_weight(value, from_unit, to_unit)
    raise ArgumentError, "Invalid from_unit: #{from_unit}" unless WEIGHT_UNITS.key?(from_unit)
    raise ArgumentError, "Invalid to_unit: #{to_unit}" unless WEIGHT_UNITS.key?(to_unit)

    value * (WEIGHT_UNITS[to_unit] / WEIGHT_UNITS[from_unit])
  end

  def self.convert_temperature(value, from_unit, to_unit)
    raise ArgumentError, "Invalid from_unit: #{from_unit}" unless TEMPERATURE_UNITS.key?(from_unit)
    raise ArgumentError, "Invalid to_unit: #{to_unit}" unless TEMPERATURE_UNITS.key?(to_unit)

    case from_unit
    when 'C'
      case to_unit
      when 'F'
        (value * (9.0 / 5.0)) + 32
      when 'K'
        value + 273.15
      else
        value
      end
    when 'F'
      case to_unit
      when 'C'
        (value - 32) * (5.0 / 9.0)
      when 'K'
        (value - 32) * (5.0 / 9.0) + 273.15
      else
        value
      end
    when 'K'
      case to_unit
      when 'C'
        value - 273.15
      when 'F'
        (value - 273.15) * (9.0 / 5.0) + 32
      else
        value
      end
    end
  end
end
