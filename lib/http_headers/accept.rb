require 'http_headers/accept/version'
require 'http_headers/utils/list'

module HttpHeaders
  class Accept # < DelegateClass(Array) determined by version
    def initialize(value)
      __setobj__ HttpHeaders::Utils::List.new(value, entry_klazz: Accept::Entry)
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
        index <=> other.send(:index)
      end

      def [](parameter)
        parameters.fetch(String(parameter).to_sym)
      end

      def to_header
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
