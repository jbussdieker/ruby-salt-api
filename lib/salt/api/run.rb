module Salt
  module Api
    module Run
      def run(args)
        req = Net::HTTP::Post.new("/")
        req['X-Auth-Token'] = token
        req['Accept'] = "application/x-yaml"
        req['Content-Type'] = "application/json"
        req.body = args.to_json
        
        resp = client.request(req)
        raise "Get request to /run failed (#{resp})" unless resp.kind_of? Net::HTTPSuccess
        parsed_resp = YAML.load(resp.body)["return"]
        raise "Multiple results? (#{parsed_resp.inspect})" if parsed_resp.length > 1
        parsed_resp.first
      end
    end
  end
end
