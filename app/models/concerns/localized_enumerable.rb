# frozen_string_literal: true

module LocalizedEnumerable
  extend ActiveSupport::Concern

  included do
    model_constantized = model_name.name.constantize

    defined_enums.each do |defined_enum|
      enum_name            = defined_enum.first
      pluralized_enum_name = enum_name.pluralize
      enum_options         = defined_enum.second

      enum_options.each do |_|
        define_method("#{enum_name}_str".to_sym) do
          return unless send(enum_name).present?

          model_constantized.human_attribute_name("#{enum_name}.#{send(enum_name)}")
        end
      end

      define_singleton_method("sorted_localized_#{pluralized_enum_name}".to_sym) do
        send(pluralized_enum_name.to_sym).keys.map do |w|
          [human_attribute_name("#{enum_name}.#{w}"), w]
        end.sort { |a, b| a <=> b }
      end

      define_singleton_method("localized_#{pluralized_enum_name}".to_sym) do
        send(pluralized_enum_name.to_sym).keys.map do |w|
          [human_attribute_name("#{enum_name}.#{w}"), w]
        end
      end
    end
  end
end
