module Salt
  module Api
    module Configure
      VALID_OPTION_KEYS = [
        :hostname,
        :username,
        :password,
        :timeout,
        :read_timeout,
        :eauth,
        :port,
        :use_ssl
      ].freeze

      attr_accessor *VALID_OPTION_KEYS

      def set_defaults
        @hostname = "salt"
        @port = 8000
        @use_ssl = true
        @eauth = 'pam'
      end

      def configure
        set_defaults
        yield self
      end
    end
  end
end
