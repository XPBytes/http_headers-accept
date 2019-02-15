require 'http_headers/utils'

module HttpHeaders
  class Accept < Utils::List
    VERSION = "0.1.0"

    def initialize(value)
      super value, entry_klazz: Accept::Entry
      sort!
    end

    class Entry
      def initialize(media_type, index:, parameters:)
        self.media_type = media_type
        self.parameters = parameters
        self.index = index

        freeze
      end

      attr_reader :media_type

      # noinspection RubyInstanceMethodNamingConvention
      def q
        parameters.fetch(:q) { 1.0 }.to_f
      end

      def <=>(other)
        quality = other.q <=> q
        return quality unless quality.zero?
        index <=> other.index
      end

      def [](parameter)
        parameters.fetch(String(parameter).to_sym)
      end

      def inspect
        to_s
      end

      def to_s
        [media_type].concat(parameters.map { |k, v| "#{k}=#{v}" }).compact.reject(&:empty?).join('; ')
      end

      private

      attr_writer :media_type
      attr_accessor :parameters, :index
    end
  end
end
