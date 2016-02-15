module Salt
  module Api
    module Jobs
      def jobs(jid = nil)
        req = Net::HTTP::Get.new(jid.nil? ? "/jobs" : "/jobs/#{jid}")
        req['X-Auth-Token'] = token
        req['Accept'] = "application/x-yaml"
        resp = client.request(req)
        raise "Get request to /jobs failed (#{resp})" unless resp.kind_of? Net::HTTPSuccess
        parsed_resp = YAML.load(resp.body)["return"]
        return parsed_resp
      end
    end
  end
end
