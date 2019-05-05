# encoding: utf-8
module Authlogic
  module Config
    def self.extended(klass)
      klass.class_eval do
        class_attribute :acts_as_authentic_config
        self.acts_as_authentic_config ||= {}
      end
    end

    private

      # This is a one-liner method to write a config setting, read the config
      # setting, and also set a default value for the setting.
      def rw_config(key, value, default_value = nil)
        value.nil? ? read_config(key, default_value) : write_config(key, value)
      end

      # Read a value for a key.
      def read_config(key, default)
        return acts_as_authentic_config[key] if acts_as_authentic_config.include?(key)

        return default.call if default.respond_to? :call

        default
      end

      # Write a value for a key and return that value.
      def write_config(key, value)
        self.acts_as_authentic_config = acts_as_authentic_config.merge(key => value)

        value
      end
  end
end
