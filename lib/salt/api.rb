require "salt/api/version"
require "salt/api/configure"
require "salt/api/client"
require "salt/api/minions"

module Salt
  module Api
    extend Configure
    extend Client
    extend Minions
  end
end
