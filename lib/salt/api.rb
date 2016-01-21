require "salt/api/version"
require "salt/api/configure"
require "salt/api/client"

module Salt
  module Api
    extend Configure
    extend Client
  end
end
