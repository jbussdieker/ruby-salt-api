require 'json'

module Salt
  module Api
    module Events
      def events(&block)
        buffer = ""
        raw_events do |data|
          buffer += data

          if buffer.match("\n")
            event, buffer = buffer.split("\n", 2)
            if event.start_with? "data: "
              yield(JSON.parse(event.split("data: ", 2).last))
            end
          end
        end
      end

      private

      def raw_events(&block)
        req = Net::HTTP::Get.new("/events")
        req['X-Auth-Token'] = token
        req['Accept'] = "application/x-yaml"
        client.request(req) do |response|
          raise "Get request to /events failed (#{response})" unless response.kind_of? Net::HTTPSuccess

          response.read_body do |chunk|
            yield(chunk)
          end
        end
      rescue Errno::ETIMEDOUT, Net::OpenTimeout => e
        e
      end
    end
  end
end
