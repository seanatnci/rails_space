require 'activeresource'
#
class User < ActiveResource::Base
  self.site = "http://localhost:3000"
end

events=User.all
puts events.inspect
