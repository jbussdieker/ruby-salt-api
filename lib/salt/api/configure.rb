module Salt
  module Api
    module Configure
      VALID_OPTION_KEYS = [
        :hostname,
        :username,
        :password,
        :timeout
      ].freeze

      attr_accessor *VALID_OPTION_KEYS

      def configure
        yield self
      end
    end
  end
end
