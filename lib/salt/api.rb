require "salt/api/version"
require "salt/api/configure"
require "salt/api/client"
require "salt/api/minions"
require "salt/api/events"

module Salt
  module Api
    extend Configure
    extend Client
    extend Minions
    extend Events
  end
end
