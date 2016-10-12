require 'rack'
require_relative '../lib/controller_base'
require 'byebug'

class MyController < ControllerBase
  def go
    # It will increment by one for each GET. A browser usually sends two GETs:
    # one for the page and one for the favicon Therefore, the counter will increment by 2.
    # If you make the call through Postman, it will increment by 1.
    session["count"] ||= 0
    session["count"] += 1
    render :counting_show
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
