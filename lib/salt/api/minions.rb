module Salt
  module Api
    module Minions
      def minions
        req = Net::HTTP::Get.new("/minions")
        req['X-Auth-Token'] = token
        req['Accept'] = "application/x-yaml"
        resp = client.request(req)
        raise "Get request to /minions failed (#{resp})" unless resp.kind_of? Net::HTTPSuccess
        parsed_resp = YAML.load(resp.body)["return"]
        raise "Multiple results? (#{parsed_resp.inspect})" if parsed_resp.length > 1
        parsed_resp.first
      end
    end
  end
end
